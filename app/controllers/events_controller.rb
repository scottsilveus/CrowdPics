class EventsController < ApplicationController

	def index
		@events = Event.all.order(:start_date)
	end

	def new
		@event = Event.new
	end

	def create
		event_uniq_url = SecureRandom.urlsafe_base64 
		params[:event][:start_date] = Date.strptime(params[:event][:start_date], "%m/%d/%Y")
		params[:event][:end_date] = Date.strptime(params[:event][:end_date], "%m/%d/%Y")
		@event = Event.create(event_params)
		@event[:event_code] = event_uniq_url
		current_user.events << @event
		if @event
			redirect_to user_path(current_user)
		end
	end

	def show
		@params = params
		@event = Event.find_by_id(params[:id])
	end

	def edit
		@event = Event.find_by_id(params[:id])
		@creator = User.find_by_id(@event.user_id)
		@current_user = current_user
	end

	def destroy
		Event.find_by_id(params[:id]).destroy
		render user_path(current_user)
	end


private

	def event_params
		params.require(:event).permit(:start_date, :end_date, :title, :description)
	end
end

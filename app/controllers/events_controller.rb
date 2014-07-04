class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		params[:event][:start_date] = Date.strptime(params[:event][:start_date], "%m/%d/%Y")
		params[:event][:end_date] = Date.strptime(params[:event][:end_date], "%m/%d/%Y")
		@event = Event.create(event_params)
		current_user.events << @event
		if @event
			redirect_to user_path(current_user)
		end
	end

	def show
		@event = Event.find_by_id(params[:id])
	end

private

	def event_params
		params.require(:event).permit(:start_date, :end_date, :title, :description)
	end
end

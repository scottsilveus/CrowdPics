class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :check_code]
	layout false, only: [:show]

	def index
		@events = Event.all.order(:start_date)
	end

	def new
		@event = Event.new
	end

	def create
		event_uniq_url = SecureRandom.urlsafe_base64(5)
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
			@event = Event.find_by_id(params[:id])
			@event_photos = @event.event_photos
			if current_user
				@check = true if current_user.id == @event.user_id
			else
				@check = false
			end
	end

	def edit
		@event = Event.find_by_id(params[:id])
		@eventphotos = @event.event_photos

		@creator = User.find_by_id(@event.user_id)
		@current_user = current_user
	end

	def destroy
		event = Event.find_by_id(params[:id])
		event.destroy
		redirect_to user_path(current_user.id)
	end

  def check_code
    code = params[:event_code]
    event = Event.find_by_event_code(code)
    if event == nil
    	redirect_to '/'
    else
    	session[:event_code] = code
      redirect_to event_path(event)
    end
  end

private

	def event_params
		params.require(:event).permit(:start_date, :end_date, :title, :description)
	end
end

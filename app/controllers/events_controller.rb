class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		logger.info params[:event][:start_date]
		@event = Event.create(event_params)
		current_user.events << @event
		if @event
			redirect_to user_path(current_user)
		end
	end

private

	def event_params
		params.require(:event).permit(:start_date, :end_date, :title, :description)
	end
end

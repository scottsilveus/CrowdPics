class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :check_code]
	layout false, only: [:show, :edit]

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

	def update
 		params[:event][:start_date] = Date.parse(params[:event][:start_date])
 		params[:event][:end_date] = Date.parse(params[:event][:end_date])
 		@event = Event.find_by(id: params[:id])
 		if @event
 			@event.update(event_params)
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
		@event_photos = @event.event_photos

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

  def send_text_message
  	event = Event.find_by_id(params[:format])
  	code = event.event_code


    number_to_send_to = params[:number_to_text].gsub(/[^\d]/, '')


    twilio_sid = ENV['TWILIO_SID'] #CrowdPics
    twilio_token = ENV['TWILIO_TOKEN'] #CrowdPics
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER'] #CrowdPics

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "+1#{number_to_send_to}",
      :body => "You have been invited to a CrowdPics Event. Here is your event code: #{code} "
    )
    redirect_to edit_user_event_path(current_user, event)
  end

private

	def event_params
		params.require(:event).permit(:start_date, :end_date, :title, :description)
	end
end

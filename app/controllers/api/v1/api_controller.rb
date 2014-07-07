class API::V1::APIController < ApplicationController
  protect_from_forgery except: :create

  def create
    event = Event.find_by_event_code(event_code_params[:event_code])
    @eventphoto = EventPhoto.new(eventphoto_params)
    logger.error(params.inspect)

      if @eventphoto.save
        event.event_photos << @eventphoto
        render  nothing: true, content_type: :json, status: 204
      else
        render  nothing: true, status: 422
      end

  end

  private

    def eventphoto_params
      params.permit(:avatar)
    end

    def event_code_params
      params.permit(:event_code)
    end

    def phone_number_params
      params.permit(:phoneNumber)
    end

end

# {"event"=>"zoo123",
#   "phoneNumber"=>"8157391105",
#   "image"=>#<ActionDispatch::Http::UploadedFile:0x007f845a54a908 @tempfile=#<Tempfile:/tmp/RackMultipart20140706-2-h0dvf7>,
#    @original_filename="picture.jpg",
#    @content_type="image/jpeg",
#    @headers="Content-Disposition: form-data; name=\"image\"; filename=\"picture.jpg\"\r\nContent-Type: image/jpeg\r\n">,
#    "action"=>"index",
#    "controller"=>"api"}

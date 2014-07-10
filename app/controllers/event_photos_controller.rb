class EventPhotosController < ApplicationController

  
  # GET /friends/new
  def new
    @event = Event.find_by_id(params[:event_id])
    @eventphoto = EventPhoto.new(event_id: @event.id)
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @eventphoto = EventPhoto.new(eventphoto_params)
    event = Event.find_by_id(params[:event_id])
    respond_to do |format|
      if @eventphoto.save
        event.event_photos << @eventphoto
        format.html { redirect_to event_path(event), notice: 'Event Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @eventphoto }
      else
        format.html { render action: 'new' }
        format.json { render json: @eventphoto.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @eventphoto.update(eventphoto_params)
        format.html { redirect_to @eventphoto, notice: 'Event Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @eventphoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @event = Event.find_by(id: params[:event_id])
    logger.info params
    @eventphoto = EventPhoto.find_by(id: params[:id])
    @eventphoto.destroy
      redirect_to edit_user_event_path(current_user, @event)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventphoto
      @eventphoto = EventPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventphoto_params
      logger.info params
      params.require(:event_photo).permit(:avatar, :name)
    end
end

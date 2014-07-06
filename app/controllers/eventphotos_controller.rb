class EventPhotosController < ApplicationController
  # GET /friends
  # GET /friends.json
  def index
    @eventphotos = EventPhoto.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @eventphoto = EventPhoto.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @eventphoto = EventPhoto.new(eventphoto_params)

    respond_to do |format|
      if @eventphoto.save
        format.html { redirect_to @eventphoto, notice: 'Event Photo was successfully created.' }
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
    @eventphoto.destroy
    respond_to do |format|
      format.html { redirect_to eventphotos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventphoto
      @eventphoto = EventPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventphoto_params
      params.require(:eventphoto).permit(:avatar, :name)
    end
end
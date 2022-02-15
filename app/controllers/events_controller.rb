class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all.order(id: :desc)
  end

  # GET /events/1 or /events/1.json
  def show
       @comments = Comment.where(event_id:params[:id])
       name =  Event.select(:category_id).where("id=?",params[:id])
      @category = Category.select("category").where("id=?",name[0].category_id)
      
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.user_id = current_user.id
  end

  # GET /events/1/edit
  def edit
    # @category = Category.all.map { |category| [category.category,category.category] }
    # @event.user_id = current_user.id
  end

  # POST /events or /events.json
  def create
    id =   Category.select("id").where("category=?",params[:event][:category])
    @event = Event.new(event_params)
      @event.category_id = id[0].id
    
    respond_to do |format|
      if @event.save 
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :description, :event_date,:user_id)

    end
end

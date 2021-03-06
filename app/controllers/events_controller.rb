class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    # if project_id　== nil?
      @events = Event.all
      # @event = Event.where(project_id: params[:project_id])
    # end
  end

  # GET /events/1 or /events/1.json
  def show
    # @events = Event.select{
      # @event.include?(params[:project_id])
    # }
    # @project = Project.find(params[:project_id])
    # binding.pry
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.project_id = params[:project_id]
    @event.user_id = current_user.id
    # @project_id = params[:project_id]
    # @project = Project.find(params[:project_id])
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    # @project = Project.find_by(project_id: [:project_id]).id
    # @event.user_id = current_user.id
    # @event.project_id = event_params[:project_id]
# binding.pry
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path(project_id: @event.project_id), notice: "Event was successfully created." }
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
      # binding.pry
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
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
      params.require(:event).permit(:user_id, :project_id, :title, :description, :start_date, :end_date)
    end
end

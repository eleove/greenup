class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @location = Location.find(params[:location_id])
    @event.location = @location
    @event.user = current_user
    if @location.save
      # CHANGER LA REDIRECTION
      redirect_to locations_path, notice: 'Success'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :schedule)
  end
end

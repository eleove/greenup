class EventsController < ApplicationController
  def index
    @events = Event.all
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

    if @event.save
      @event_participant = EventParticipant.create(user: current_user, event: @event)
      redirect_to event_path(@event), notice: 'Collecte créée !'
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

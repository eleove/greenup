class EventParticipantsController < ApplicationController
  def create
    @event_participant = EventParticipant.new
    @event = Event.find(params[:event_id])
    @event_participant.event = @event
    @event_participant.user = current_user
    if @event_participant.save
      # CHANGER LA REDIRECTION
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event), notice: 'Failure'
    end
  end

  def destroy
    # à simplifier en ne faisant pas une nested route
    @event = Event.find(params[:event_id])
    @event_participant = EventParticipant.find_by(user: current_user, event: @event)
    @event_participant.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to event_path(@event_participant.event)
  end
end

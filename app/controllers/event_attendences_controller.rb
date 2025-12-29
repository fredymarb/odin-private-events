class EventAttendencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    is_user_allowed = current_user == @event.creator || @event.invitees.exists?(current_user.id)

    if @event.is_private? && !is_user_allowed
      redirect_to @event, alert: "You have not been invited to this event."
      return
    end

    EventAttendence.find_or_create_by!(
      attendee: current_user,
      attended_event: @event
    )

    redirect_to @event, notice: "You are now attending this event"
  end

  def destroy
    attendence = current_user.event_attendences.find_by!(
      attended_event: @event
    )

    attendence.destroy
    redirect_to @event, notice: "You are no longer attending this event."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end

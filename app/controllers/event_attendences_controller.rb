class EventAttendencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    attendence = EventAttendence.new(
      attendee: current_user,
      attended_event: @event
    )

    if attendence.save
      redirect_to @event, notice: "You are now attending this event"
    else
      redirect_to @event, notice: "You are already attending this event"
    end
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

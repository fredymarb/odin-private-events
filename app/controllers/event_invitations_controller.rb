class EventInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    return head :forbidden unless @event.creator == current_user

    @event.event_invitations.create(invitee_id: params[:invitee_id])
    redirect_to @event, notice: "User invited"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end

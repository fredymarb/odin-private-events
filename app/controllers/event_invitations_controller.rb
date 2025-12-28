class EventInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :set_invitee

  def create
    return head :forbidden unless @event.creator == current_user

    invite = @event.event_invitations.build(invitee: @invitee)

    if invite.save
      redirect_to @event, notice: "User Invited"
    else
      redirect_to @event, alert: "User has already been invited."
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_invitee
    @invitee = User.find(params[:invitee_id])
  end
end

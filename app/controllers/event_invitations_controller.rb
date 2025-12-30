class EventInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :authorize_creator!

  def create
    @invite = @event.event_invitations.build(event_invitation_params)

    if @invite.save
      redirect_to @event, notice: "User invited"
    else
      redirect_to @event, alert: @invite.errors.full_messages.to_sentence
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def authorize_creator!
    redirect_to @event, alert: "Not authorized" unless @event.creator == current_user
  end

  def event_invitation_params
    params.require(:event_invitation).permit(:invitee_id)
  end
end

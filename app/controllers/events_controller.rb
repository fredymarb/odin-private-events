class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])

    return if !(@event.is_private?)

    allowed =
      @event.creator == current_user ||
      @event.invitees.include?(current_user) ||
      @event.attendees.include?(current_user)

    redirect_to events_path, alert: "This event is private." unless allowed
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event created successfully."
    else
      render :new, alert: "Failed to create event."
    end
  end

  private

  def event_params
    params.expect(event: [ :title, :location, :date, :is_private ])
  end
end

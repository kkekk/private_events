class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action :restricted_access, only: [:edit, :update, :destroy], unless: proc {user_is_host}

  def index
    @events = Event.all
  end

  def show
    @hosts = @event.hosts
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      @event.attendings.create!(user_id: current_user.id, role: 'host')
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  def user_is_host
    @event.hosts.include? current_user
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:name, :description, :starts_at, :ends_at)
  end

  def restricted_access
    redirect_back fallback_location: event_url, notice: "That ain't your event!"
  end

  helper_method :user_is_host
end

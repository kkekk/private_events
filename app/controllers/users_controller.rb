class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_current_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @hostings = @user.hostings
    @attendings = @user.attendees
  end

  def attend_event
    current_user.attendings.create!(event_id: params[:event_id], role: 'attendee')
    redirect_to event_url, notice: "Event attended successfully!"
  end

  def unattend_event
    # TODO
  end
end

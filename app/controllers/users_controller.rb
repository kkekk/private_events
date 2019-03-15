class UsersController < ApplicationController
  before_action :user_authorization, only: [:show, :attend_event]

  def show
    @user = User.find(params[:id])
    @hostings = @user.hostings
    @attendings = @user.attendees
  end

  def attend_event
    current_user.attendings.create!(event_id: params[:event_id], role: 'attendee')
    redirect_to event_url, notice: "Event attended successfully!"
  end
end

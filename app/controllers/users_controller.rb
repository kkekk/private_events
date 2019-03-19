class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_current_user

  def show
    @user = User.find(params[:id])
    @hostings = @user.hostings
    @attendings = @user.attendees
  end
end

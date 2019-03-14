class UsersController < ApplicationController
  def show
    @user = current_user
    @hostings = @user.hostings
    @attendings = @user.attendees
  end
end

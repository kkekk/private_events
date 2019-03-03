class UsersController < ApplicationController
  def show
    @user = current_user
    @attendings = @user.hostings
  end
end

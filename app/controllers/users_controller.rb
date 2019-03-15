class UsersController < ApplicationController
  before_action :user_authorization, only: [:show]

  def show
    @user = User.find(params[:id])
    @hostings = @user.hostings
    @attendings = @user.attendees
  end

  private

  def user_authorization
    unless current_user && current_user.id.to_s == params[:id]
      redirect_back fallback_location: root_url, notice: "that ain't your account"
    end
  end
end

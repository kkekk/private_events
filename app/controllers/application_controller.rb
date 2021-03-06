class ApplicationController < ActionController::Base

  private

  def is_current_user
    unless current_user && current_user.id.to_s == params[:id]
      redirect_back fallback_location: root_url, notice: "that ain't your account"
    end
  end
end

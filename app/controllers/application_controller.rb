class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :authorize

  protected

  def authorize
    redirect_to root_url, error: "You must be logged in to comment" unless current_user && current_user.admin
  end

end

class ApplicationController < ActionController::Base
  #include Clearance::Authentication
  protect_from_forgery

  protected

  def authorize
    current_user && current_user.admin
  end

end

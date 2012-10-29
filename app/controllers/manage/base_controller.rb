class Manage::BaseController < ActionController::Base
  #include Clearance::Authentication
  before_filter :authorize
  before_filter :require_admin

  layout 'manage'

  protected

  def require_admin
    redirect_to root_url, :error => 'You must be an administrator' unless signed_in? and current_user.admin
  end

end

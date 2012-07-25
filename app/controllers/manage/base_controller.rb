class Manage::BaseController < ActionController::Base

  before_filter :require_admin


  def require_admin
    redirect_to root_url, error: 'You must be an administrator' unless signed_in? and current_user.admin
  end

end

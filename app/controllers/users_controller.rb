class UsersController < ApplicationController
  before_filter :authorize

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes params[:user]
    redirect_to profile_url
  end

end

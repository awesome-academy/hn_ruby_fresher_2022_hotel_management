class Admin::AdminController < ApplicationController
  layout "admin"

  before_action :admin_user

  private
  def admin_user
    redirect_to login_path if current_user.try :admin?
  end
end

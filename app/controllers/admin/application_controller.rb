class Admin::ApplicationController < ActionController::Base
  layout 'admin'

  helper_method :logged_in?, :current_user
  before_action :notification_view
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to admin_users_path unless logged_in?
  end
  def notification_view
    @notifications = Notification.all.order(id: :desc)
  end
end

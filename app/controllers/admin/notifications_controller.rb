class Admin::NotificationsController < Admin::ApplicationController
  def index
    @notifications = Notification.all.order(id: :desc).paginate(page: params[:page], per_page: 10)
  end
  def unread
    @unread_notifications = Notification.where(status: false)
  end
end

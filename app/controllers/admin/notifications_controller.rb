class Admin::NotificationsController < Admin::ApplicationController
  def index
    @notifications = Notification.all.order(id: :desc).paginate(page: params[:page], per_page: 10)
  end
end

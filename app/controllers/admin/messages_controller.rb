class Admin::MessagesController < Admin::ApplicationController
  def index
    @messages = Message.all.order(id: :desc).paginate(page: params[:page], per_page: 5)
  end
  def show
    @message = Message.find(params[:id])
    @message.notifications.update(status: true)
  end
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_messages_path
  end
end

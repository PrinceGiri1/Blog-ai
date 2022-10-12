class WelcomeController < ApplicationController
  def index
    
  end
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message Create Successfully"
      redirect_to welcome_index_path
    else
      render "new"
    end
  end
private
    def message_params
      params.require(:message).permit(:full_name, :email, :content)
    end

end

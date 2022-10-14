class Admin::SessionsController < Admin::ApplicationController
  def new
    if current_user.present?
      redirect_to admin_users_path
      flash[:alert] = "You Are Already Login"
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login Successfully"
      redirect_to admin_path
    else
      flash[:alert] = 'Invalid Email or Password'
      redirect_to new_admin_session_path
      end
  end

  def destroy
      session[:user_id] = nil
      flash[:alert] = 'Session Successfully Log Out'
      redirect_to admin_users_path
  end
end

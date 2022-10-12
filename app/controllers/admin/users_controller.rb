class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], per_page: 5).order(id: :desc)
  end
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "User Update Successfully"
       redirect_to admin_users_path
    else
       render "edit"
    end
  end

  def home
    @posts = Post.all.paginate(page: params[:page], per_page: 5 ).order(id: :desc)
    @comments = Comment.all.paginate(page: params[:page], per_page: 3).order(id: :desc)
  end






  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :about, :email, :password, :avatar)
    end


end

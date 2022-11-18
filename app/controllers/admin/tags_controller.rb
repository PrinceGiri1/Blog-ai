class Admin::TagsController < Admin::ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all.paginate(page: params[:page], per_page: 5).order(id: :desc)
  end
  def new
    @tag = Tag.new
  end
  def create
    @user = Tag.new(tag_params)
    @users = @user.name.split(",")
    @users.each do |user|
      @newtag = Tag.create(name: user)
       @newtag.save
    end
    redirect_to admin_tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render "edit"
    end
  end
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end
  private
    def tag_params
      params.require(:tag).permit(:name)
    end

end

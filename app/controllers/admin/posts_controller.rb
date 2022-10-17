class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 4).order(id: :desc)
  end
  def show
    @tag_id = Post.friendly.find(params[:id]).tag_ids
    @post = Post.friendly.find(params[:id])

  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post Create Successfully"
      redirect_to admin_posts_path
    else
      render "new"
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    params[:tag_ids]&.each do |tag_ids|
      @post.post_tags.create(tag_id: tag_ids)
    end
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
private
  def post_params
    params.require(:post).permit(:title, :content, :name, :is_publish, :thumbnail, :intro, tag_ids: [])
  end
end

class HomeController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5).order(id: :desc)
  end
  def show
    @post = Post.friendly.find(params[:id])
    @comment = @post.comments.build
    @tags = @post.tags
  end
  
  
end












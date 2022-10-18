class ArticlesController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: @blog_setting.post_per_page)
  end
  def show
    @post = Post.friendly.find(params[:id]).increment!(:view_count)
    @comment = @post.comments.build
    @tags = @post.tags
  end
end
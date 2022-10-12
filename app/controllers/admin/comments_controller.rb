class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.all.paginate(page: params[:page], per_page: 2).order(id: :desc)
  end
  def show
    @comment = Comment.find(params[:id])
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comment_path
  end
  def approve
		@approve=Comment.find(params[:id])
    @approve.update(status: true)
    redirect_to admin_comments_path
	end
	def disapprove
		@disapprove=Comment.find(params[:id])
    @disapprove.update(status:false)
    redirect_to admin_comments_path
	end
end

class CommentsController < ApplicationController
	def create
     @comment = Comment.new(comment_params)
     @comment.save!
     redirect_to "/"
   end

	def comment_params
     params.require(:comment).permit(:post_id, :message)
    end
	
end


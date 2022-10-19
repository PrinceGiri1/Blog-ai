class CommentsController < ApplicationController
	def create
		@comment = Comment.create(comment_params)
		@comment.save!
		respond_to do |format|
        format.html { redirect_to article_path(@comment.post_id) }
        format.js 
    	end
	end
	def comment_params
		params.require(:comment).permit(:post_id, :message,:full_name, :email)
	end
end

	
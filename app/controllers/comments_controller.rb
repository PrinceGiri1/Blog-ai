class CommentsController < ApplicationController
	def create
		@comment = Comment.create(comment_params)
		@comment.save!
		redirect_to article_path(@comment.post_id)
	 end

	def comment_params
		params.require(:comment).permit(:post_id, :message,:full_name, :email)
	end
end

	
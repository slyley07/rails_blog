class CommentsController < ApplicationController
  def create
  	@comment = Comment.create(params.require(:comment).permit(:body).merge(user: current_user, post_id: params[:post_id]))
  	respond_to do |format|
  		format.html { redirect_to @comment.post }
  		format.js
  	end
  end

  def destroy
  end
end

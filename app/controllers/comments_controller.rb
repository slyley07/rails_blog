class CommentsController < ApplicationController
  def create
  	@post = Post.find_by(post_id: params[:post_id])
  	@comment = Comment.create(params.require(:comment).permit(:body).merge(user: current_user, post_id: params[:post_id]))
  	redirect_to post_path(params[:post_id])
  end

  def destroy
  end
end

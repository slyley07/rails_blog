class PostsController < ApplicationController
  def index
  	@posts=Post.all
    @post=Post.new

  end

  def new
  	@post=Post.new
  end

  def show    
    @post=Post.find(params[:id])
    @posts=Post.all
    @post=Post.new
  end

  def create
  	@post=Post.new(params.require(:post).permit(:title, :p_content).merge(user: current_user))
  	# if @post.save
  	redirect_to posts_path, notice: "New Post created"
  	# else
  	# render :new
  	# end
  end

  def destroy
  	@post=Post.find(params[:id])
  	@post.destroy
  	redirect_to @post, notice: "Post was deleted"

  end
end

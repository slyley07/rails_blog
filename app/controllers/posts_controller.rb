class PostsController < ApplicationController
 	before_action :set_post, only: [:show, :edit, :update, :destroy]

 	def index
    @post = Post.new
 		@posts = Post.all
 	end

  # def new
  # 	@post = Post.new
  # end

  def show
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def edit
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
      respond_to do |format|
    		format.html { redirect_to posts_path }
        format.js
      end
  	else
  		render :new
  	end
  end

  def update
  	if @post.update(post_params)
  		redirect_to posts_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@post.destroy
  	#comment destroy too
  	redirect_to posts_path
  end

  private

  	def post_params
  		params.require(:post).permit(:title, :p_content).merge(user: current_user)
  	end

  	def set_post
  		@post = Post.find(params[:id])
  	end
end

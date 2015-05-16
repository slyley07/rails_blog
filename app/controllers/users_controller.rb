class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :new, :show]
  
  def index
    @users = User.all
    @post = Post.new
    @posts = Post.all
  end
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
  
  def edit
    @user = current_user
  end

  def password
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "New account created!"
    else
      render :new, notice: "There was a problem creating your account."
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def close
  end

  def destroy
    if @user.password == params[:user][:password]
      @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    else
      flash[:alert] = "That was the wrong password!"
      render :close
    end
  end

  def follow
    @relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:id])
    @user = User.find(params[:id])
    if @relationship.save
      respond_to do |format|
        format.js
      end
      # flash[:notice] = "You're now following #{@user.username}"
      
    else
      # flash[:alert] = "There was a problem following that user!"
    end
    redirect_to @user
  end

  def unfollow
    @relationship = Relationship.find_by(follower_id: current_user, followed_id: params[:id])
    @user = User.find(params[:id])
    if @relationship and @relationship.destroy
      flash[:notice] = "You've successfully unfollowed #{@user.username}"
    else
      flash[:alert] = "There was a problem unfollowing that user"
    end
    redirect_to @user
  end
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :fname, :lname, :email, :password)
    end

end

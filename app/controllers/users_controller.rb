class UsersController < ApplicationController


  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def show
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :fname, :lname, :email, :password))
    if @user.save
      redirect_to users_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:username, :fname, :lname, :email, :password))
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end

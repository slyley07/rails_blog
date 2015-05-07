class SessionsController < ApplicationController
  def new
  end

  def create
  	@user=User.find_by(username: params[:username])
  	if @user and @user.password == params[:password]
  		session[:user_id] = @user.id
  		flash[:notice]= "Succesfully logged in."
  		redirect_to @user
  end
end

  def destroy
  	session[:user_id] = nil
  	redirect_to users_path
  	flash[:notice]= "Succesfully logged out."
  end
end

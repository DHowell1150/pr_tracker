class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = user_params
    user[:username] = user[:username].downcase
    new_user = User.new(user_params)
    
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.username}!"
      redirect_to login_path
    else 
      redirect_to new_user
      flash[:error] = "Sorry, your credentials are bad"
    end
  end

  def login_form #like a new action
  end

  def login # like a create action
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      render :login_form
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
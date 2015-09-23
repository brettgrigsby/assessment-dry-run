class UsersController < ApplicationController

  before_action :check_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:notice] = "Welcome, Dawg"
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:warning] = "Failed to create new Dawg"
      redirect_to :back
    end
  end

  def show

  end

  def check_user
    redirect_to new_user_path unless session[:user_id]
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

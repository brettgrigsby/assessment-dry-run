class SessionsController < ApplicationController

  def create
    #byebug
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:warning] = "Invalid Login"
      redirect_to root_path
    end
  end
end

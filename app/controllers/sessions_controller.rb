class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      sign_in user
      if user.admin? # if the user is an admin redirect to the user show page
        redirect_to users_path, notice: "Welcome back mighty admin!"
      else # they are just a regular use and redirect to the normal homepage
        redirect_to profiles_path, notice: "Sign in successful!"
      end
    else
      flash[:alert] = "Wrong credentials!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are logged out!"
  end
end

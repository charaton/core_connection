class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user, :current_user_profile

  def sign_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end

  def current_user_profile
    current_user&.profile
  end

  def authenticate_user
    redirect_to new_session_path, notice: "Please Sign in." unless user_signed_in?
  end

  def find_profile
    @profile = if current_user.admin?
      Profile.find(params[:profile_id])
    else
      current_user_profile
    end
  end
end

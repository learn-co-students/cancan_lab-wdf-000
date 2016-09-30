class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_or_create_by(id: session[:user_id])
  end

  def require_login
    redirect_to root_path if session[:user_id].blank?
  end
end

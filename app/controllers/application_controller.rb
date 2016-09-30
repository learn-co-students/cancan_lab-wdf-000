class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    # redirecting to login_path wouldn't allow posting to notes#create
    redirect_to root_path, :alert => exception.message
  end

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end

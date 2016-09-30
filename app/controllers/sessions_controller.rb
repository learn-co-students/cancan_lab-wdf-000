class SessionsController < ApplicationController
  # Will act as homepage
  # May redirect to notes index if @user is logged in
  def new
  end

  def create
    if params[:name].blank?
      redirect_to login_path
    else
      @user = User.find_or_create_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to notes_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end

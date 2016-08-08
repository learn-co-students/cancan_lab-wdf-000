class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_or_create_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end  
end

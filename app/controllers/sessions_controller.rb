class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:name] == nil || params[:name].empty?
      # binding.pry
      redirect_to sessions_new_path
    else
      user = User.find_by(name: params[:name])
      session[:user_id] = user.id
      redirect_to '/'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to sessions_new_path
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create

    return redirect_to login_path if (!params[:name] || params[:name].empty?)
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to controller: 'notes', action: 'index'
  end

  def destroy
    session[:user_id].delete
    redirect_to login_path
  end

end

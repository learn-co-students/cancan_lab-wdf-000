class UsersController < ApplicationController

  def new
  end

  def create
    binding.pry
    user = User.find_or_create_by(name: params[:name])
    ###Add different route here in case the creation goes South
    session[:user_id] = user.id
    redirect_to '/'
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_or_create_by(user_params)
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end

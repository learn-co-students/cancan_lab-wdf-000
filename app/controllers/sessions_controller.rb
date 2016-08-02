class SessionsController < ApplicationController

	def create
		binding.pry
		user = User.find_or_create_by(name: params[:username])
		session[:user_id] = user.id
		redirect '/'
	end

	def destroy
		session.delete :username
	end
end

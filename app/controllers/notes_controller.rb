require 'pry'

class NotesController < ApplicationController
	# load_and_authorize_resource 
	# before_action :require_login

	def create
		
		if require_login
			note = Note.new(notes_params)
			note.user = current_user
			note.save!
		end

		redirect_to '/'
	end

	def new
		@note = Note.new
	end

	def update
		note = Note.find(params[:id])
		note.update(notes_params)
		redirect_to '/'
	end

	def edit

	end

	def delete

	end

	private
	def notes_params
		params.require(:note).permit(:content, :visible_to)
	end

	

end

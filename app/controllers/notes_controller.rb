class NotesController < ApplicationController

  def create
    if !session[:user_id].nil?
      note = Note.new(note_params)
      note.user = User.find(session[:user_id])
      note.readers << note.user
      note.save
    end
    redirect_to '/'
  end

  def update
    user = User.find(session[:user_id])
    if user && user.notes.include?(Note.find(params[:id]))
      note = Note.find(params[:id])
      note.update(note_params)
      note.readers << user
      note.save
    end
    redirect_to '/'
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end

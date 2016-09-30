class NotesController < ApplicationController

  def new
  end

  def create
    if session[:user_id]
      note = Note.create(note_params)
      note.user_id = session[:user_id]
      visible_to = note_params[:visible_to]
      if !note.visible_to.empty?
        note.readers << note.visible_to
      end
      note.readers << note.user
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to root_path
  end

  def index
  end

  def show
  end

  def destroy
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end

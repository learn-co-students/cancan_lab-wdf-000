class NotesController < ApplicationController
  load_and_authorize_resource only: [:create, :edit, :show, :update]
  def index

  end
  
  def new
    @note = Note.new
  end

  def create
      @note = Note.new(note_params)
      @note.user = current_user
      @note.readers << current_user
      @note.save
      redirect_to '/'
  end

  def edit
    @note = Note.find(params[:id])
  end
  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    @note.save
    redirect_to '/'
  end
  private


  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end

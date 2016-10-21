class NotesController < ApplicationController


  def index
    
  end

  def create
    if current_user
      note = Note.new(note_params)
      note.readers << current_user
      note.save
    end
      redirect_to '/'
  end

  def new
    
  end

  def edit
    
  end

  def show
    
  end

  def update
    note = Note.find_by(id: params[:id])
    note.update(note_params)
    note.readers << current_user
    redirect_to '/'
  end

  def delete
    
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  
end

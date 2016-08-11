class NotesController < ApplicationController
  load_and_authorize_resource
  
  def index
      @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    if session[:user_id] != nil && current_user
      @note = Note.new(note_params)
      @note.user = current_user
      @note.save
    end
    redirect_to '/'
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def show
    @note = Note.find(params[:user_id])
  end

  def delete
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end

class NotesController < ApplicationController
  # load_and_authorize_resource
  load_and_authorize_resource
  # load_and_authorize_resource only: [:edit, :show, :update]

  def show
    binding.pry
    @note = Note.find_by(id: params[:id])
  end

  def new
    binding.pry
  end

  def create
    if logged_in?
      note = Note.new(note_params)
      note.user = current_user
      note.readers << current_user
      note.save
    end
    redirect_to '/'
  end

  def update
    if logged_in?
      @note = Note.find_by(id:params[:id])
      if @note
        @note.update(note_params)
      end
    end
    return redirect_to '/'
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end

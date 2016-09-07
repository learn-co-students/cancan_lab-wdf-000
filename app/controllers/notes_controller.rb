class NotesController < ApplicationController
  before_action :require_login, only: [:create, :update]

  def create
    if !require_login
      note = Note.new(note_params) 
      note.user = current_user
      note.readers << current_user
      note.save
    end
    # authorize! :manage, @note
    redirect_to '/'
  end

  def update
    note = Note.find_by(id: params[:id])
    note.update( note_params ) if note
    redirect_to '/'
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end

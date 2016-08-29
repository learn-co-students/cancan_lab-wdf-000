class NotesController < ApplicationController
  before_action :require_login, only: [:edit, :show, :update]

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save
    redirect_to '/'
  end

  def update
    Note.find(params[:id]).update(note_params)
    redirect_to '/'
  end

  private
  def note_params
    params.require(:note).permit(:content,:visible_to)
  end
end

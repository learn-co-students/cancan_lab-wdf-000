class NotesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]
  load_and_authorize_resource
  skip_authorize_resource only: [:index, :new, :create]

  def index
    return Note.new unless current_user
    @notes = current_user.readable
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.readers << current_user
    @note.save
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  def delete
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end

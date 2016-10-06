class NotesController < ApplicationController
  before_action :require_login, only: [:create, :update]

  def new
  end

  def create
    # byebug
    note = Note.new(note_params)
    note.user = current_user
    note.save
    redirect_to root_path

  end

  def edit
  end

  def update
    note = Note.find_by(id: params[:id])
    note.update(note_params) if note
    redirect_to root_path
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end

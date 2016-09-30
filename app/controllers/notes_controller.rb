class NotesController < ApplicationController
  # Instead of having to add the following to each action:
  # authorize! :read, @note
  # We use this macro...
  # NOTE: Using this macro immediately expects the use of the helper
  # current_user. So it needs to be defined before we use it!
  load_and_authorize_resource

  before_action :require_login

  def index
  end

  def new
  end

  def create
    # This is very step by step. Is there a better way?
    @note = Note.create(note_params)
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
    # load_and_authorize_resource loads @note for each action
    # @note = Note.(id: params[:id])
    @note.update(note_params)
    @note.readers 

    redirect_to root_path
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def require_login
    redirect_to root_path if session[:user_id].blank?
  end

end

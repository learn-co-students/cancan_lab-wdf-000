class NotesController < ApplicationController
 # load_and_authorize_resource


  def create
    if current_user
      note = current_user.notes.build(note_params)
        note.readers << current_user
        note.save
          flash[:success] = 'Project was saved!'
            redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
     @note = Note.find_by(id: params[:id])
     @note.update(note_params)
     @note.readers << current_user
     redirect_to root_path
 end





  private

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end







end

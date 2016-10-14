class NotesController < ApplicationController
 load_and_authorize_resource


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

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    binding.pry
    note = Note.find_by(id: params[:id])
      if note.update(note_params)
        redirect_to root_path
      else
        redirect_to root_path
      end
  end





  private

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end







end

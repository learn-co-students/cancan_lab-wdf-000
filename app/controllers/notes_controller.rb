class NotesController < ApplicationController

  def create
    # binding.pry
    if logged_in?
      @note = Note.new(set_params)
      @note.readers << current_user
      @note.save
    end
    return redirect_to '/'
  end

  def update
    if logged_in?
      @note = Note.find_by(id:params[:id])
      if @note
        @note.update(set_params)
        # return redirect_to note_path(@note)
      end
    end
    # binding.pry
    return redirect_to '/'
  end

  private
  def set_params
    params.require(:note).permit(:content,:visible_to)
  end
end

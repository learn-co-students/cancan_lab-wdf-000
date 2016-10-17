class NotesController < ApplicationController

  def create
    if current_user
      @note = Note.create(note_params)
      @note.readers << current_user

      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def show
      @note = Note.find(params[:id])
      authorize! :read, @note
  end


  def update
    if current_user
      if @note = Note.find_by(id: params[:id])
        @note.content = params[:note][:content]
        @user = User.find_by(name: params[:note][:visible_to])
        @viewer = Viewer.find_by_id(@user.id)
        @note.viewers << @viewer
        @note.readers << @user
        @note.save
        redirect_to '/'
      else
        redirect_to '/'
      end
    end
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end

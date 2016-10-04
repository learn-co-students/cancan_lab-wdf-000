class NotesController < ApplicationController
  # whole crud
  before_action :current_user
  load_and_authorize_resource

  def new
    @note = Note.create(note_params)
  end

  def show
     @note = Note.find(params[:id])
     authorize! :read, @note
   end

  def create
    if !require_login
      note = Note.create(note_params)
      note.readers << current_user
      note.save
    end
    redirect_to "/"
  end

  def edit
  end

  def update

    # if !require_login
    #   user = current_user
    #   note = Note.update(note_params)
    #   note.readers << current_user
    #   redirect_to note_path(note)
    #
    # else
    #   # redirect_to "/"
    #   redirect_to notes_path
    # end
    # binding.pry

    # note = Note.find_by(params[:id])
    #  note.update(note_params)
    #  redirect_to root_path

       note = Note.find_by(id: params[:id])

      #  binding.pry
       note.update(note_params) if note
       note.save
       # binding.pry
     redirect_to "/"
  end


  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end


end

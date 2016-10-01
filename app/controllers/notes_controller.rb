class NotesController < ApplicationController
  # load_and_authorize_resource
  before_action :current_user

  # GET /notes
  # GET /notes.json
  def index
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
  end

  # GET /notes/1/edit
  def edit
  end
  # POST /notes
  # POST /notes.json
  def create
    if !require_login
      @note = Note.new(note_params)
      @note.user_id = session[:user_id]
      
      @note.save
      # @note.readers.create(id: session[:user_id])
    end
    # binding.pry
    redirect_to '/'
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @note = Note.find_by(id: params[:id])
    if !require_login
      @note.update(note_params)
      # @note.readers << user.find_by(id: session[:user_id]) if 
      # @note.save
    end
    redirect_to '/'
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content, :visible_to)
    #   params.require[:note].permit(:content, :visible_to)
    end
end

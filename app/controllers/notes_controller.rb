class NotesController < ApplicationController
  before_action :require_login

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(content: note_params[:content])
    @note.user = User.find_by_id(session[:user_id])
    @note.visible_to=note_params[:visible_to]
    @note.readers << @note.user
    @note.save
    redirect_to '/'
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(content: note_params[:content])
    @note.visible_to=note_params[:visible_to]
    @note.readers << @note.user
    @note.save
    redirect_to '/'
  end

  def index
  end



  private
  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end

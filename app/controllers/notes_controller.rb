class NotesController < ApplicationController

  # before_action :require_login


  def new
    @note = Note.new
  end

  def create
    if current_user == nil
      redirect_to '/'
    else
      # binding.pry
      @note = current_user.notes.build(note_params)
      @note.readers << current_user

      if @note.save
        redirect_to '/'
      else
        render 'new'
      end
    end
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    # binding.pry
    if current_user == nil
      redirect_to '/'
    else
      @note = Note.find_by(id: params[:id])
      @note.update(note_params)
      @note.readers << current_user
      # binding.pry
      redirect_to '/'
    end
  end




  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  # def require_login
  #   return head(:forbidden) unless session.include? :name
  # end


end

class NotesController < ApplicationController
  # Instead of having to add the following to each action:
  # authorize! :read, @note
  # We use this macro...
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

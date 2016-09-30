class RenameColumnUserInNotes < ActiveRecord::Migration
  def change
    rename_column :notes, :user, :user_id
  end
end

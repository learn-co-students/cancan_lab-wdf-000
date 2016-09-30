class ChangeUserColumnInNotes < ActiveRecord::Migration
  def change
    change_column :notes, :user, :integer
  end
end

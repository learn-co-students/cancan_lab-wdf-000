class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :note_id
      t.integer :user_id
    end
  end
end

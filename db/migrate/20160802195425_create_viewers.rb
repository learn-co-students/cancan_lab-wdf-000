class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
    	t.integer :note_id, index: true, foreign_key: true
    	t.integer :user_id, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

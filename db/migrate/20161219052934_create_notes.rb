class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :user
      t.text :content
      t.integer :user_id
      t.text :readers, array: true, default: []


      t.timestamps null: false
    end
  end
end

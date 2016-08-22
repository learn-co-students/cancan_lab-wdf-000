class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.belongs_to :note
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end

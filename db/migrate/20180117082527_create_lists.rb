class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.datetime :deleted_at
      t.boolean :deleted

      t.timestamps
    end
  end
end

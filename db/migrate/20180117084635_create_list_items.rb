class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.references :list, foreign_key: true
      t.string :name
      t.datetime :deleted_at
      t.boolean :deleted

      t.timestamps
    end
  end
end

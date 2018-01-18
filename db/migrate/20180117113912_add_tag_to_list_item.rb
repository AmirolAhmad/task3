class AddTagToListItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :list_items, :tag, foreign_key: { to_table: :tags }
  end
end

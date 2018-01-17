class List < ApplicationRecord
  has_many :list_items, dependent: :destroy

  def is_deleted?
    deleted_at != nil
  end
end

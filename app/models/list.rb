class List < ApplicationRecord
  include SoftDeletable
  has_many :list_items, dependent: :destroy

  def is_deleted?
    deleted_at != nil
  end
end

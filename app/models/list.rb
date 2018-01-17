class List < ApplicationRecord

  def is_deleted?
    deleted_at != nil
  end
end

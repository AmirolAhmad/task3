class ListItem < ApplicationRecord
  include SoftDeletable
  belongs_to :list
  has_many :tags
end

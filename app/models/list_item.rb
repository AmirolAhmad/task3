class ListItem < ApplicationRecord
  include SoftDeletable
  belongs_to :list
end

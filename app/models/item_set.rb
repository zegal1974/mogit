class ItemSet < ApplicationRecord
  has_many :items, foreign_key: "set_id"
end

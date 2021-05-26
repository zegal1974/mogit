class ItemAppearance < ApplicationRecord
  has_many :items, inverse_of: :appearance, foreign_key: "appearance_id"
end

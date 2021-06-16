class ItemAppearance < ApplicationRecord
  has_many :items, foreign_key: :appearance_id

  has_many :transmog_set_members
  has_many :transmog_sets, through: :transmog_set_members
end

class ItemAppearance < ApplicationRecord
  has_many :items, inverse_of: :appearance, foreign_key: "appearance_id"

  has_many :transmog_set_members
  has_many :transmog_sets, through: :transmog_set_members, source: :item_appearance,
    class_name: 'TransmogSet'
  
end

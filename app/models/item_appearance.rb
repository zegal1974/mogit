class ItemAppearance < ApplicationRecord
  has_many :items, inverse_of: :appearance, foreign_key: "appearance_id"

  has_many :transmog_set_members
  has_many :transmog_sets, through: :transmog_set_members, source: :item_appearance,
    class_name: 'TransmogSet'

  # https://wowpedia.fandom.com/wiki/Const_TRANSMOG_SOURCE
  # 1 TRANSMOG_SOURCE_1	Boss Drop	
  # 2 TRANSMOG_SOURCE_2	Quest	
  # 3 TRANSMOG_SOURCE_3	Vendor	
  # 4 TRANSMOG_SOURCE_4	World Drop	
  # 5 TRANSMOG_SOURCE_5	Achievement	
  # 6 TRANSMOG_SOURCE_6	Profession	




end

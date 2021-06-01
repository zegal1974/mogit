class Item < ApplicationRecord
  include ItemLoader

  belongs_to :item_class
  belongs_to :item_sub_class
  belongs_to :set, class_name: 'ItemSet'
  belongs_to :appearance, class_name: 'ItemAppearance', inverse_of: :items

  # https://wowpedia.fandom.com/wiki/Const_TRANSMOG_SOURCE
  # TRANSMOG_SOURCE_1 = "Boss Drop";
  # TRANSMOG_SOURCE_2 = "Quest";
  # TRANSMOG_SOURCE_3 = "Vendor";
  # TRANSMOG_SOURCE_4 = "World Drop";
  # TRANSMOG_SOURCE_5 = "Achievement";
  # TRANSMOG_SOURCE_6 = "Profession";
  enum display_type: { 1: "Boss Drop", 2: "Quest", 3: "Vendor", 4: "World Drop", 5: "Achievement", 6: "Profession"}

  # https://wowpedia.fandom.com/wiki/Enum.ItemQuality
  # 0	Poor	Poor	ITEM_QUALITY0_DESC
  # 1	Common	Common	ITEM_QUALITY1_DESC
  # 2	Uncommon	Uncommon	ITEM_QUALITY2_DESC
  # 3	Rare	Rare	ITEM_QUALITY3_DESC
  # 4	Epic	Epic	ITEM_QUALITY4_DESC
  # 5	Legendary	Legendary	ITEM_QUALITY5_DESC
  # 6	Artifact	Artifact	ITEM_QUALITY6_DESC
  # 7	Heirloom	Heirloom	ITEM_QUALITY7_DESC
  # 8	WoWToken  	WoW Token	ITEM_QUALITY8_DESC

end

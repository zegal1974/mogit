class Item < ApplicationRecord
  include ItemLoader

  belongs_to :item_class
  belongs_to :item_sub_class
  belongs_to :set, class_name: 'ItemSet'
  belongs_to :appearance, class_name: 'ItemAppearance', inverse_of: :items
  # belongs_to :source

  # https://github.com/Ketho/BlizzardInterfaceResources
  enum source_type: { None: 0, JournalEncounter: 1, Quest: 2, Vendor: 3, WorldDrop: 4, 
    HiddenUntilCollected: 5, CantCollect: 6, Achievement: 7, Profession: 8, NotValidForTransmog: 9 }

  enum quality: { Poor: 0, Common: 1, Uncommon: 2, Rare: 3, Epic: 4, Legendary: 5,
		Artifact: 6, Heirloom: 7, WoWToken: 8 }
  
  # None, Bind on Pickup, Bind on Equip, Bind on Use, Quest
  enum bind_type: { none: 0, acquire: 1, equip: 2, use: 3, quest: 4 }
end

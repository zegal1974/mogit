class Item < ApplicationRecord
  belongs_to :item_sub_class
  belongs_to :set, class_name: 'ItemSet'
  belongs_to :appearance, class_name: 'ItemAppearance', inverse_of: :items

  enum quality: { Poor: 0, Common: 1, Uncommon: 2, Rare: 3, Epic: 4, Legendary: 5,
		Artifact: 6, Heirloom: 7, WoWToken: 8 }
  
  # None, Bind on Pickup, Bind on Equip, Bind on Use, Quest
  # enum bind_type: { none: 0, acquire: 1, equip: 2, use: 3, quest: 4 }

  scope :by_appearance_modifier, ->(id) { where(:appearance_modifier_id) }

  def item_class
    return item_sub_class.parent if !item_sub_class.nil?
  end

  def find_class_id id
    Item.joins(:item_sub_class).where(item_class_id: id).count
  end
end
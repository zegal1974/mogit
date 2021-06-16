class TransmogSet < ApplicationRecord
  belongs_to :group, class_name: 'TransmogSetGroup'
  # belongs_to :tracking_quest, optional: false
  belongs_to :name_description, class_name: 'ItemNameDescription'
  belongs_to :parent, class_name: 'TransmogSet'

  has_many :transmog_set_members
  has_many :appearances, class_name: 'ItemAppearance', source: :item_appearance,
    through: :transmog_set_members
end

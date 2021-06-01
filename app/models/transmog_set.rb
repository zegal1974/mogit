class TransmogSet < ApplicationRecord
  belongs_to :group, class_name: 'TransmogSetGroup'
  belongs_to :tracking_quest
  belongs_to :item_name_description
  belongs_to :parent, class_name: 'TransmogSet'

  has_many :transmog_set_members
  has_many :appearances, class_name: 'ItemAppearance', source: :item_appearance,
    through: :transmog_set_members
end
    

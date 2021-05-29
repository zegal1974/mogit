class TransmogSet < ApplicationRecord
  belongs_to :group, class_name: 'TransmogSetGroup'
  belongs_to :tracking_quest
  belongs_to :item_name_description
  belongs_to :parent, class_name: 'TransmogSet'
end

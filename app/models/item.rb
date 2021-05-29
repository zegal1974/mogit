class Item < ApplicationRecord
  include ItemLoader

  belongs_to :item_class
  belongs_to :item_sub_class
  belongs_to :set, class_name: 'ItemSet'
  belongs_to :appearance, class_name: 'ItemAppearance', inverse_of: :items

end

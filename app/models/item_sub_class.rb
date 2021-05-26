class ItemSubClass < ApplicationRecord
  belongs_to :parent, class_name: 'ItemClass', optional: true
end

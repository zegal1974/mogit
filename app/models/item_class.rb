class ItemClass < ApplicationRecord
  has_many :sub_classes, class_name: 'ItemSubClass', foreign_key: :parent_id
end

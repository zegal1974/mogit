class Faction < ApplicationRecord
  belongs_to :parent, class_name: 'Faction', optional: true
  has_many :children, class_name: 'Faction', foreign_key: 'parent_id'

  belongs_to :group, class_name: 'FactionGroup', optional: true

end

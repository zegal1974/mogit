class Faction < ApplicationRecord
  belongs_to :group, class_name: 'FactionGroup', optional: true
end

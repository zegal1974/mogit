class Faction < ApplicationRecord
  include FactionLoader

  belongs_to :group, class_name: 'FactionGroup', optional: true
end

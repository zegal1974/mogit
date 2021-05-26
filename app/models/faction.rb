class Faction < ApplicationRecord
  include FactionLoader

  belongs_to :parent, optional: true
end

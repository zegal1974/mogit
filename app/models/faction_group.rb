class FactionGroup < ApplicationRecord
  has_many :factions, foreign_key: :group_id
end

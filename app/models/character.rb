class Character < ApplicationRecord
  include ChrLoader

  belongs_to :faction
  belongs_to :race
  belongs_to :chr_class
  belongs_to :active_covenant
end

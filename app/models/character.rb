class Character < ApplicationRecord
  include ChrLoader
  include DatastoreChrLoader

  belongs_to :realm
  belongs_to :faction
  belongs_to :race
  belongs_to :chr_class
  belongs_to :active_covenant
end

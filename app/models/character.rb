class Character < ApplicationRecord
  include ChrLoader
  include DatastoreChrLoader

  belongs_to :realm
  belongs_to :faction, optional: true
  belongs_to :race
  belongs_to :chr_class
  belongs_to :active_covenant, optional: true

  enum gender: { unknown: 1, male: 2, female: 3 }
end

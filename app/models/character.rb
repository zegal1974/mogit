class Character < ApplicationRecord
  include ChrLoader
  include DatastoreChrLoader

  belongs_to :realm, optional: true
  belongs_to :race, optional: true
  belongs_to :chr_class, optional: true
  # belongs_to :active_covenant, optional: true

  enum gender: { unknown: 1, male: 2, female: 3 }
end

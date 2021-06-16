class TransmogSetGroup < ApplicationRecord
  has_many :sets, class_name: 'TransmogSet', foreign_key: 'group_id'
end

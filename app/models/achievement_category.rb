class AchievementCategory < ApplicationRecord
  belongs_to :parent, class_name: 'AchievementCategory', optional: true
  has_many :children, class_name: 'AchievementCategory', foreign_key: :parent_id

  has_many :achievements, foreign_key: :category_id
end

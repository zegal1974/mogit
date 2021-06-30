class Achievement < ApplicationRecord
  belongs_to :instance, optional: true
  belongs_to :supercede, class_name: 'Achievement', optional: true
  belongs_to :category, class_name: 'AchievementCategory', optional: true
  belongs_to :icon_file, optional: true
  belongs_to :reward_item, optional: true
  belongs_to :covenat, optional: true
end

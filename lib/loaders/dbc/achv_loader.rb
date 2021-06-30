module AchvLoader
  include CsvLoader

  MAP_ACHV = {
    id: 'ID',
    name: 'Title_lang',
    description: 'Description_lang',
    reward: 'Reward_lang',
    instance_id: 'Instance_ID',
    faction_id: 'Faction',
    supercede_id: 'Supercedes',
    category_id: 'Category',
    points: 'Points',
    flags: 'Flags',
    order: 'Ui_order',
    icon_file_id: 'IconFileID',
    reward_item_id: 'RewardItemID',
    minimum_criteria: 'Minimum_criteria',
    criteria_tree: 'Criteria_tree',
    shares_criteria: 'Shares_criteria',
    covenant_id: 'CovenantID'
  }

  def load_achievements path=nil
    path ||= DEFAULT_PATH

    csv_text = File.read(path + "/achievement.csv")
    csv = CSV.parse(csv_text, :headers => true)

    records = {}
    csv.each do |row|
      next if row['ID'].nil?
      records[row['ID']] = map_convert(MAP_ACHV, row)
    end

    Achievement.delete_all
    Achievement.insert_all!(records.values)
  end

  MAP_ACHV_CTG = {
    id: 'ID',
    name: 'Name_lang',
    parent_id: 'Parent',
    order: 'Ui_order'
  }

  def load_achievement_categories path=nil
    path ||= DEFAULT_PATH

    csv_text = File.read(path + "/achievement_category.csv")
    csv = CSV.parse(csv_text, :headers => true)

    records = {}
    csv.each do |row|
      next if row['ID'].nil?
      records[row['ID']] = map_convert(MAP_ACHV_CTG, row) do |row, key|
        if key == 'Parent' && row[key] == '-1'
          nil
        else
          row[key]
        end
      end
    end

    AchievementCategory.delete_all
    AchievementCategory.insert_all!(records.values)
  end
end
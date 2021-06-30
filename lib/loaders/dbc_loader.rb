module DbcLoader
  extend ItemLoader
  extend ChrLoader
  extend FactionLoader
  extend AchvLoader

  def self.load_all
    load_classes
    load_races

    load_factions
    load_faction_groups

    load_achievement_categories
    load_achievements

    load_item_appearances
    load_item_classes
    load_item_sub_classes
    load_items
    load_item_name_descriptions
    load_transmog_set_groups
    load_transmog_sets
    load_transmog_set_items
  end
end
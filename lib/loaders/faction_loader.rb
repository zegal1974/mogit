
module FactionLoader
  include CsvLoader

  MAP_FACTION = {
    id: 'ID',
    name: 'Name_lang',
    description: 'description'
  }

  def load_factions path=nil
    csv = load_csv "/faction.csv", path

    csv.each do |row|
      faction = Faction.where(id: row['ID']).first_or_create(map_convert(MAP_FACTION, row))
    end
  end

  MAP_FACTION_GROUP = {
    id: 'ID',
    name: 'Name_lang',
    internal_name: 'InternalName',
    mask_id: 'MaskID'
  }

  def load_faction_groups path=nil
    csv = load_csv "/factiongroup.csv", path

    csv.each do |row|
      fg = FactionGroup.where(id: row['ID']).first_or_create(map_convert(MAP_FACTION_GROUP, row))
    end
  end

end
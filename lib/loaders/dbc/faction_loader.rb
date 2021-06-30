
module FactionLoader
  include CsvLoader

  # faction.csv
  # ReputationRaceMask[0], ReputationRaceMask[1], ReputationRaceMask[2], ReputationRaceMask[3],
  # Name_lang, Description_lang, ID, ReputationIndex ,ParentFactionID, Expansion,
  # FriendshipRepID, Flags, ParagonFactionID,
  # ReputationClassMask[0],ReputationClassMask[1],ReputationClassMask[2],ReputationClassMask[3],
  # ReputationFlags[0],ReputationFlags[1],ReputationFlags[2],ReputationFlags[3],
  # ReputationBase[0],ReputationBase[1],ReputationBase[2],ReputationBase[3],
  # ReputationMax[0],ReputationMax[1],ReputationMax[2],ReputationMax[3],
  # ParentFactionMod[0],ParentFactionMod[1],
  # ParentFactionCap[0],ParentFactionCap[1]

    MAP_FACTION = {
    id: 'ID',
    name: 'Name_lang',
    description: 'description',
    parent_id: 'ParentFactionID',
    reputation_index: 'ReputationIndex',
    expansion: 'Expansion',
    race_mask_0: 'ReputationRaceMask[0]',
    race_mask_1: 'ReputationRaceMask[1]',
    race_mask_2: 'ReputationRaceMask[2]',
    race_mask_3: 'ReputationRaceMask[3]',
    class_mask_0: 'ReputationClassMask[0]',
    class_mask_1: 'ReputationClassMask[1]',
    class_mask_2: 'ReputationClassMask[2]',
    class_mask_3: 'ReputationClassMask[3]'
  }

  def load_factions path=nil
    p "starting load factions..."
    csv = load_csv "/faction.csv", path

    csv.each do |row|
      faction = Faction.where(id: row['ID']).first_or_create!(map_convert(MAP_FACTION, row))
    end
    p "load %i factions..."  % Faction.count
  end

  MAP_FACTION_GROUP = {
    id: 'ID',
    name: 'Name_lang',
    internal_name: 'InternalName',
    mask_id: 'MaskID'
  }

  def load_faction_groups path=nil
    p "starting load faction groups..."
    csv = load_csv "/factiongroup.csv", path

    csv.each do |row|
      fg = FactionGroup.where(id: row['ID']).first_or_create(map_convert(MAP_FACTION_GROUP, row))
    end
    p "load %i faction groups..."  % FactionGroup.count
  end

end
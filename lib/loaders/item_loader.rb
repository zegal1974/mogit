
module ItemLoader
  include CsvLoader

  MAP_ITEM_CLASS = {
    id: 'ClassID',
    name: 'ClassName_lang'
  }

  def load_item_classes path=nil
    path ||= DEFAULT_PATH

    csv_text = File.read(path + "/itemclass.csv")
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      iclass = ItemClass.where(id: row['ClassID']).first_or_create(map_convert(MAP_ITEM_CLASS, row))
    end
  end

  MAP_ITEM_SUB_CLASS = {
    id: 'ID',
    name: 'DisplayName_lang',
    vname: 'VerboseName_lang',
    order: 'SubClassID',
    parent_id: 'ClassID'
  }

  def load_item_sub_classes path=nil
    path ||= DEFAULT_PATH

    csv_text = File.read(path + "/itemsubclass.csv")
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      ItemSubClass.where(id: row['ID']).first_or_create(map_convert(MAP_ITEM_SUB_CLASS, row))
    end
  end

  MAP_ITEM = {
    id: 'ID',
    # item_sub_class_id: 'SubclassID',
    quality: 'Material',
    inventory_type: 'InventoryType',
    sheathe_type: 'SheatheType',
    icon_file_data_id: 'IconFileDataID'
  }

  MAP_ITEM_SPARSE = {
    name: 'Display_lang',
    bond_type: 'Bonding',
    level: 'ItemLevel',
    allowable_race: 'AllowableRace',
    expansion_id: 'ExpansionID'
  }

  MAP_ITEM_APPEARANCE_ITEMS = {
    id: 'ItemID',
    appearance_id: 'ItemAppearanceID',
    appearance_modifier_id: 'ItemAppearanceModifierID'
    # source_type: 'TransmogSourceTypeEnum'
  }

  def sub_class_to_hash
    ret = {}
    ItemSubClass.all.each do |isc|
      ret[[isc.parent_id, isc.order]] = isc.id
    end
    ret
  end

  def load_items path = nil
    records = {}

    sub_class_hash = sub_class_to_hash

    csv = load_csv "/item.csv", path
    csv.each do |row|
      next if row['ID'].nil?
      records[row['ID']] ||= {} 
      records[row['ID']].merge!(map_convert(MAP_ITEM, row))
      records[row['ID']][:item_sub_class_id] = 
        sub_class_hash[[row['ClassID'], row['SubClassID']]]
    end

    csv = load_csv "/itemsparse.csv", path
    csv.each do |row|
      next if row['ID'].nil? or records[row['ID']].nil?
      records[row['ID']].merge!(map_convert(MAP_ITEM_SPARSE, row))
    end

    csv = load_csv "/itemmodifiedappearance.csv", path
    csv.each do |row|
      next if row['ItemID'].nil? or records[row['ItemID']].nil?
      records[row['ItemID']].merge!(map_convert(MAP_ITEM_APPEARANCE_ITEMS, row))
    end

    load_item_sets(path) do |i, set, item|
      records[item][:set_id] = set if !records[item].nil?
    end

    records.each do |key, value|
      value[:name] ||= ''
      value[:allowable_race] ||= '-1'
      value[:appearance_id] = nil if value[:appearance_id].nil? or value[:appearance_id] == 0
      value[:appearance_modifier_id] = nil if value[:appearance_modifier_id].nil? or value[:appearance_modifier_id] == 0
      # value[:source_type] ||= nil
      value[:bond_type] ||= nil
      value[:level] ||= 0
      value[:expansion_id] ||= nil
      value[:set_id] ||= nil
    end

    Item.delete_all
    Item.insert_all!(records.values)
  end

  MAP_ITEM_SET = {
    id: 'ID',
    name: 'Name_lang',
    flags: 'SetFlags'
  }

  def load_item_sets path=nil, &block
    sets = {}
    csv = load_csv "/itemset.csv", path
    csv.each do |row|
      next if row['ID'].nil?
      set_id = row['ID']
      sets[set_id] = {}
      sets[set_id].merge!(map_convert(MAP_ITEM_SET, row))
      (0..16).each do |i|
        id = row["ItemID[#{i}]"]
        next if id == 0 or id == '0'
        yield i, set_id, id
      end
    end

    ItemSet.delete_all
    ItemSet.insert_all!(sets.values)
  end

  MAP_ITEM_APPEARANCE = {
    id: 'ID',
    display_type: 'DisplayType',
    icon_file_data_id: 'DefaultIconFileDataID',
    order: 'UiOrder',
    player_condition_id: 'PlayerConditionID'
  }

  def load_item_appearances path=nil
    csv = load_csv "/itemappearance.csv", path
    records = {}
    csv.each do |row|
      next if row['ID'].nil?
      records[row['ID']] ||= {} 
      records[row['ID']].merge!(map_convert(MAP_ITEM_APPEARANCE, row))
    end
    ItemAppearance.delete_all
    ItemAppearance.insert_all!(records.values)
  end

  MAP_TRANSMOG_SET_GROUP = {
    id: 'ID',
    name: 'Name_lang'
  }

  def load_transmog_set_groups path=nil
    csv = load_csv "/transmogsetgroup.csv", path
    records = {}
    csv.each do |row|
      next if row['ID'].nil?
      records[row['ID']] = map_convert(MAP_TRANSMOG_SET_GROUP, row)
    end
    TransmogSetGroup.delete_all
    TransmogSetGroup.insert_all!(records.values)
  end

  MAP_TRANSMOG_SET = {
    id: 'ID',
    name: 'Name_lang',
    class_mask: 'ClassMask',
    tracking_quest_id: 'TrackingQuestID',
    flags: 'Flags',
    group_id: 'TransmogSetGroupID',
    name_description_id: 'ItemNameDescriptionID',
    parent_id: 'ParentTransmogSetID',
    expansion_id: 'ExpansionID',
    patch: 'PatchIntroduced',
    order: 'UiOrder'
  }

  def load_transmog_sets path=nil
    csv = load_csv "/transmogset.csv", path
    records = {}
    csv.each do |row|
      next if row['ID'].nil?
      records[row['ID']] = map_convert(MAP_TRANSMOG_SET, row)
    end
    TransmogSet.delete_all
    TransmogSet.insert_all!(records.values)
  end

  MAP_TRANSMOG_SET_ITEM = {
    transmog_set_id: 'TransmogSetID',
    item_appearance_id: 'ItemModifiedAppearanceID',
    flags: 'Flags'
  }

  def load_transmog_set_items path=nil
    csv = load_csv "/transmogsetitem.csv", path
    records = []
    csv.each do |row|
      records << map_convert(MAP_TRANSMOG_SET_ITEM, row)
    end
    TransmogSetMember.delete_all
    TransmogSetMember.insert_all!(records)      
  end

  MAP_SOURCEINFO_ITEM = {
    id: 'ID',
    text: 'SourceText_lang',
    source_type: 'SourceTypeEnum',
    pvp_faction: 'PvpFaction'
  }

  def load_item_sources path=nil
    csv = load_csv "/sourceinfo.csv", path
    records = []
    csv.each do |row|
      records << map_convert(MAP_SOURCEINFO_ITEM, row)
    end
    ItemSource.delete_all
    ItemSource.insert_all!(records)        
  end

  MAP_ITEM_NAME_DESCRIPTION_ITEM = {
    id: 'ID',
    description: 'Description_lang',
    color: 'Color'
  }

  def load_item_name_descriptions path=nil
    csv = load_csv "/itemnamedescription.csv", path
    records = []
    csv.each do |row|
      records << map_convert(MAP_ITEM_NAME_DESCRIPTION_ITEM, row)
    end
    ItemNameDescription.delete_all
    ItemNameDescription.insert_all!(records)        
  end
end

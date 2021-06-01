require 'csv'

module ItemLoader
  extend ActiveSupport::Concern

  module ClassMethods
    include CsvLoader

    MAP_ITEM_CLASS = {
      id: 'ClassID',
      name: 'ClassName_lang'
    }

    MAP_ITEM_SUB_CLASS = {
      id: 'SubClassID',
      name: 'DisplayName_lang',
      parent_id: 'ClassID'
    }

    def load_item_classes path=nil
      path ||= DEFAULT_PATH

      csv_text = File.read(path + "/itemclass.csv")
      csv = CSV.parse(csv_text, :headers => true)

      csv.each do |row|
        iclass = ItemClass.where(id: row['ClassID']).first_or_create(map_convert(MAP_ITEM_CLASS, row))
        # iclass.save
      end
    end

    def load_item_sub_classes path=nil
      path ||= DEFAULT_PATH

      csv_text = File.read(path + "/itemsubclass.csv")
      csv = CSV.parse(csv_text, :headers => true)

      csv.each do |row|
        ItemSubClass.where(id: row['SubClassID']).first_or_create(map_convert(MAP_ITEM_SUB_CLASS, row))
      end
    end

    MAP_ITEM = {
      id: 'ID',
      item_class_id: 'ClassID',
      item_sub_class_id: 'SubclassID',
      quality: 'Material',
      inventory_type: 'InventoryType',
      sheathe_type: 'SheatheType',
      icon_file_data_id: 'IconFileDataID'
    }

    MAP_ITEM_NAME = {
      id: 'ID',
      name: 'Display_lang',
      allowable_race: 'AllowableRace'
    }

    MAP_ITEM_APPEARANCE_ITEMS = {
      id: 'ItemID',
      appearance_id: 'ItemAppearanceID',
      source_type: 'TransmogSourceTypeEnum'
    }

    def load_items path = nil
      records = {}

      csv = load_csv "/item.csv", path
      csv.each do |row|
        next if row['ID'].nil?
        records[row['ID']] ||= {} 
        records[row['ID']].merge!(map_convert(MAP_ITEM, row))
      end

      csv = load_csv "/itemsearchname.csv", path
      csv.each do |row|
        next if row['ID'].nil? or records[row['ID']].nil?
        records[row['ID']].merge!(map_convert(MAP_ITEM_NAME, row))
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
        value[:appearance_id] ||= nil
        value[:source_type] ||= nil
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
      item_name_description_id: 'ItemNameDescriptionID',
      parent_id: 'ParentTransmogSetID',
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
      p records.length
      TransmogSetMember.delete_all
      TransmogSetMember.insert_all!(records)      
    end

    def load_item_all
      load_item_appearances
      load_item_classes
      load_item_sub_classes
      load_items
      #load_item_sets
      load_transmog_set_groups
      load_transmog_sets
      load_transmog_set_items
    end
  end
end

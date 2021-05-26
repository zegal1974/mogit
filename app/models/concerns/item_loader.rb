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

      records.each do |key, r|
        r[:name] ||= ''
        r[:allowable_race] ||= '-1'
        r[:appearance_id] ||= nil
        r[:source_type] ||= nil
      end

      Item.delete_all
      Item.insert_all!(records.values)
    end

    MAP_ITEM_APPEARANCE = {
      id: 'ID',
      display_type: 'DisplayType',
      icon_file_data_id: 'DefaultIconFileDataID',
      order: 'UiOrder',
      player_condition_id: 'PlayerConditionID'
    }
    # display_type:integer icon_file_data_id:integer order:integer 
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
  end
end

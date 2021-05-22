require 'csv'

module ItemLoader
  extend ActiveSupport::Concern

  module ClassMethods
    def load_items
      csv_text = File.read('public/db/item.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        item = Item.where(did: row['ID']).first_or_initialize
        item.item_class = row['ClassID']
        item.item_sub_class = row['SubclassID']
        item.quality = row['Material']
        item.inventory_type = row['InventoryType']
        item.sheathe_type = row['SheatheType']
        item.icon_file_data_id = row['IconFileDataID']
        item.save
      end
    end
  end
end
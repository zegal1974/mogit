require 'csv'

module ChrLoader
  extend ActiveSupport::Concern

  module ClassMethods
    include CsvLoader

    MAP_CHR_CLASS = {
      id: 'ID',
      name: 'Name_lang',
      fname: 'Filename',
      description: 'Description_lang'
    }

    def load_classes path=nil
      path ||= DEFAULT_PATH

      csv_text = File.read(path + "/chrclasses.csv")
      csv = CSV.parse(csv_text, :headers => true)

      csv.each do |row|
        chrclass = ChrClass.where(id: row['ID']).first_or_initialize(map_convert(MAP_CHR_CLASS, row))
        chrclass.bg_color = (row['ChatColorR'].to_i << 16) + (row['ChatColorG'].to_i << 8) + row['ChatColorB'].to_i
        chrclass.save
      end
    end

    MAP_RACE = {
      id: 'ID',
      name: 'Name_lang',
      prefix_name: 'ClientPrefix',
      fname: 'ClientFileString',
      fname: 'Filename',
      description: 'Description_lang'
    }

    def load_races path=nil
      path ||= DEFAULT_PATH

      csv_text = File.read(path + "/chrraces.csv")
      csv = CSV.parse(csv_text, :headers => true)

      csv.each do |row|
        race = Race.where(id: row['ID']).first_or_create(map_convert(MAP_RACE, row))
      end
    end

    def load_all
      load_classes
      load_races
    end
  end
end
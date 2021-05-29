require 'csv'

module FactionLoader
  extend ActiveSupport::Concern

  module ClassMethods
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
  end
end
module DatastoreChrLoader
  extend ActiveSupport::Concern

  module ClassMethods
    include DatastoreLoader

    MAP_DS_CHARACTER = {
      level: 'level',
      last_update: 'lastUpdate',
      money: 'money',
      gender: 'gender',
      played: 'played',
      played_this_level: 'playedThisLevel',
      last_logout: 'lastLogoutTimestamp'
    }

    def load_characters
      characters = []

      lua = load_lua "DataStore_Characters.lua"
      db = lua['DataStore_CharactersDB']
      global = db['global']['Characters']
      return if chrs.nil?
      chars = chrs.to_h

      chrs.each do |k, v|
        # "Default.黑暗之矛.Zebudah"
        character = load_character(k, v)
        characters << character if !character.nil?
      end
      
      lua.close
      return characters
    end

    def load_character name, table
      key = to_utf8 name

      match = key.scan(/Default\.([[:word:]]+)\.([[:word:]]+)/)
      return nil if match.empty?
      table = table.to_h

      character = map_convert(MAP_DS_CHARACTER, table)
      character[:name] = to_utf8 match[0][1]

      realm_name = to_utf8 match[0][0]
      # realm = Realm.where(name: realm_name).first_or_create
      # character[:realm] = realm.id

      name = to_utf8 table['race']
      # race = Race.where(name: name).first
      # character[:race_id] = race.id if !race.nil?

      character[:zone] =  to_utf8 table['zone']
      character[:sub_zone] = to_utf8 table['subZone']
      character[:bind_location] = to_utf8 table['bindLocation']
      return character
    end
  end
end
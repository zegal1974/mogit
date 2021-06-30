module DatastoreRepLoader
  include DatastoreLoader

  def load_reputations
    lua = load_lua "DataStore_Reputations.lua"
    chrs = lua['DataStore_ReputationsDB']['global']['Characters']

    return if chrs.nil?
    chars = chrs.to_h

    chrs.each do |k, v|
      load_character_rep(k, v)
    end
  end

  def load_character_rep name, table
    key = to_utf8 name

    match = key.scan(/Default\.([[:word:]]+)\.([[:word:]]+)/)
    return nil if match.empty?

    realm_name = to_utf8 match[0][0]
    realm = Realm.where(name: realm_name).first_or_create!

    chr_name = to_utf8 match[0][1]
    character = Character.where(name: chr_name, realm: realm).first_or_create!

    reps = table['Factions']
    reps.each do |id, value|
      reputation = Reputation.where(faction_id: id, character_id: character.id).first_or_initialize
      if !reputation.nil?
        reputation.earned = value
        reputation.save
      else
        p "%s, %s" % [character.name, index]
      end
    end
  end
end
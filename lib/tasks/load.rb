# require 'rails'
require 'rufus-lua'

WOW_PATH = '/mnt/d/games/World of Warcraft'
ACCOUNT = "COOLCAT197"
DATA_PATH = "/_retail_/WTF/Account/COOLCAT197/SavedVariables/"

PATH = WOW_PATH + DATA_PATH

path = PATH + "DataStore_Agenda.lua"
file = File.open(path)
content = file.read
lua = Rufus::Lua::State.new
lua.eval(content).to_h

def load_all
  load_Agenda
end

def to_utf8 str
  ret = str.dup.force_encoding(Encoding::UTF_8)
  ret.encode(Encoding::UTF_8, Encoding::GBK) unless ret.valid_encoding?
  ret
end

def load_lua lua_file
  path = PATH + "DataStore_Agenda.lua"
  lua = Rufus::Lua::State.new
  File.open(path) do |file|
    content = file.read
    begin
      lua.eval(content)
    rescue => e
      puts(e)
      lua.close
    end
  end
  return lua
end

def load_Agenda
  lua = load_lua "DataStore_Agenda.lua"

  ps = lua['DataStore_AgendaDB']['profileKeys']
  profiles = {}
  ps.each do |k, v|
    key = to_utf8 k
    ks = key.split('-')
    profile = ks[0].strip
    realm = ks[1].strip
    if !profiles.has_key? profile
      profiles[profile] = { realm: realm }
    end
  end

  cs = lua['DataStore_AgendaDB']['global']["Characters"]
  cs.each do |k, v|
    # "Default.黑暗之矛.Zebudah"
    key = to_utf8 k
    match = key.scan(/Default\.[[:word:]]+\.([[:word:]]+)/)
    if !match.empty?
      profile = match[0]
      lastUpdate = v['lastUpdate']
      profiles[profile] ||= {}
      profiles[profile]['lastUpdate'] = Time.at(lastUpdate)

      if !v['DungeonIDs'].empty?
        v['DungeonIDs'].each do |d, v|

        end
      end
    end
  end



  p profiles['莉亚德琳伯爵']

end

load_all
require 'rufus-lua'

module DatastoreLoader
  WOW_PATH = "/mnt/d/games/World of Warcraft"
  ACCOUNT = "COOLCAT197"
  DATA_PATH = "/_retail_/WTF/Account/COOLCAT197/SavedVariables/"
  
  PATH = WOW_PATH + DATA_PATH

  def load_lua lua_file, path=nil, &block
    path ||= PATH
    path = path + lua_file
    lua = Rufus::Lua::State.new
    File.open(path) do |file|
      content = file.read
      begin
        lua.eval(content)
        yield lua
      rescue => e
        # puts(e)
        lua.close
      end
    end
    return lua
  end

  def to_utf8 str
    return "" if str.nil?
    ret = str.dup.force_encoding(Encoding::UTF_8)
    ret.encode(Encoding::UTF_8, Encoding::GBK) unless ret.valid_encoding?
    ret
  end

  def map_convert map, row
    ret = {}
    map.each do |k, v|
      ret[k] = row[v]
    end
    ret
  end

end
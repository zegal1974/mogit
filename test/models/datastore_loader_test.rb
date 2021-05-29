require "test_helper"

class DatastoreLoaderTest < ActiveSupport::TestCase

  test "test" do
    content = %Q[
      DataStore_CharactersDB = {
        ["global"] = {
          ["Characters"] = {
            ["Default.黑暗之矛.Zebudah"] = {
              ["XPMax"] = 100000000,
              ["played"] = 764984,
              ["playedThisLevel"] = 20038,
              ["isResting"] = true,
              ["lastUpdate"] = 1621786580,
              ["englishClass"] = "MONK",
              ["activeCovenantID"] = 4,
              ["race"] = "血精灵",
              ["level"] = 60,
              ["XP"] = 0,
              ["activeSoulbindID"] = 4,
              ["class"] = "武僧",
              ["RestXP"] = 0,
              ["guildRankName"] = "官员",
              ["guildRankIndex"] = 1,
              ["money"] = 168662361,
              ["renownLevel"] = 2,
              ["classID"] = 10,
              ["name"] = "Zebudah",
              ["bindLocation"] = "兵主之座",
              ["faction"] = "部落",
              ["subZone"] = "银行",
              ["guildName"] = "粑粑",
              ["englishRace"] = "BloodElf",
              ["gender"] = 3,
              ["lastLogoutTimestamp"] = 1621786580,
              ["zone"] = "沙塔斯城",
            }
          }
        }
      }
    ]
    lua = Rufus::Lua::State.new
    lua.eval(content)
    c = lua['DataStore_CharactersDB']['global']['Characters'].to_h
    character = Character.load_character c.keys[0], c.values[0]
    p character
  end
end

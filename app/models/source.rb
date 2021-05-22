class Source < ApplicationRecord

  enum inv_type: {"non_equip" => 0, "head"=>1, "neck"=>2, "shoulder"=>3, "body"=>4, "chest"=>5, "waist"=>6, "legs"=>7, "feet"=>8, "wrist"=>9, "hand"=>10, "finger"=>11, "trinket"=>12, "weapon"=>13, "shield"=>14, "ranged"=>15, "cloak"=>16, "2_hweapon"=>17, "bag"=>18, "tabard"=>19, "robe"=>20, "weaponmainhand"=>21, "weaponoffhand"=>22, "holdable"=>23, "ammo"=>24, "thrown"=>25, "rangedright"=>26, "quiver"=>27, "relic"=>28}
  enum quality_type: {"poor"=>0, "standard"=>1, "good"=>2, "superior"=>3, "epic"=>4, "legendary"=>5, "artifact"=>6, "heirloom"=>7, "wow_token"=>8}
  enum source_type:  {"boss drop"=>1, "quest"=>2, "vendor"=>3, "world drop"=>4, "achievement"=>5, "profession"=>6}
end
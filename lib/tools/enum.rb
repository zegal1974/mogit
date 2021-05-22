
invType = [
  { Name: "IndexNonEquipType", Type: "InventoryType", EnumValue: 0 },
  { Name: "IndexHeadType", Type: "InventoryType", EnumValue: 1 },
  { Name: "IndexNeckType", Type: "InventoryType", EnumValue: 2 },
  { Name: "IndexShoulderType", Type: "InventoryType", EnumValue: 3 },
  { Name: "IndexBodyType", Type: "InventoryType", EnumValue: 4 },
  { Name: "IndexChestType", Type: "InventoryType", EnumValue: 5 },
  { Name: "IndexWaistType", Type: "InventoryType", EnumValue: 6 },
  { Name: "IndexLegsType", Type: "InventoryType", EnumValue: 7 },
  { Name: "IndexFeetType", Type: "InventoryType", EnumValue: 8 },
  { Name: "IndexWristType", Type: "InventoryType", EnumValue: 9 },
  { Name: "IndexHandType", Type: "InventoryType", EnumValue: 10 },
  { Name: "IndexFingerType", Type: "InventoryType", EnumValue: 11 },
  { Name: "IndexTrinketType", Type: "InventoryType", EnumValue: 12 },
  { Name: "IndexWeaponType", Type: "InventoryType", EnumValue: 13 },
  { Name: "IndexShieldType", Type: "InventoryType", EnumValue: 14 },
  { Name: "IndexRangedType", Type: "InventoryType", EnumValue: 15 },
  { Name: "IndexCloakType", Type: "InventoryType", EnumValue: 16 },
  { Name: "Index2HweaponType", Type: "InventoryType", EnumValue: 17 },
  { Name: "IndexBagType", Type: "InventoryType", EnumValue: 18 },
  { Name: "IndexTabardType", Type: "InventoryType", EnumValue: 19 },
  { Name: "IndexRobeType", Type: "InventoryType", EnumValue: 20 },
  { Name: "IndexWeaponmainhandType", Type: "InventoryType", EnumValue: 21 },
  { Name: "IndexWeaponoffhandType", Type: "InventoryType", EnumValue: 22 },
  { Name: "IndexHoldableType", Type: "InventoryType", EnumValue: 23 },
  { Name: "IndexAmmoType", Type: "InventoryType", EnumValue: 24 },
  { Name: "IndexThrownType", Type: "InventoryType", EnumValue: 25 },
  { Name: "IndexRangedrightType", Type: "InventoryType", EnumValue: 26 },
  { Name: "IndexQuiverType", Type: "InventoryType", EnumValue: 27 },
  { Name: "IndexRelicType", Type: "InventoryType", EnumValue: 28 }
]
enum_inv = {}
invType.each do |t|
  match = t[:Name].scan(/Index(\w+)Type/)
  if !match.empty? 
    enum_inv[match[0][0].underscore] = t[:EnumValue]
  end
end

tQuality = 
[
  { Name: "Poor", Type: "ItemQuality", EnumValue: 0 },
  { Name: "Standard", Type: "ItemQuality", EnumValue: 1 },
  { Name: "Good", Type: "ItemQuality", EnumValue: 2 },
  { Name: "Superior", Type: "ItemQuality", EnumValue: 3 },
  { Name: "Epic", Type: "ItemQuality", EnumValue: 4 },
  { Name: "Legendary", Type: "ItemQuality", EnumValue: 5 },
  { Name: "Artifact", Type: "ItemQuality", EnumValue: 6 },
  { Name: "Heirloom", Type: "ItemQuality", EnumValue: 7 },
  { Name: "WowToken", Type: "ItemQuality", EnumValue: 8 }
]

enum_q = {}
tQuality.each do |t|
  enum_q[t[:Name].underscore] = t[:EnumValue]
end

source_type = 
 {1 => "Boss Drop",
 2  => "Quest",
3 => "Vendor",
 4 => "World Drop",
 5 => "Achievement",
 6 => "Profession"}


enum_st = {}
source_type.each do |k, v|
  enum_st[v.underscore] = k
end
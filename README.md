https://wowpedia.fandom.com/wiki/API_C_TransmogCollection.GetSourceInfo
https://wowpedia.fandom.com/wiki/API_C_TransmogSets.GetSetSources

rails g realm name
rails g guild name


rails g guild_profiles guild:belongs_to profiles:belongs_to rank_name rank_index:integer

# 誓约
rails g Covenant did:integer name

rails g Dungeon name category 
rails g Boss name dungeon:belongs_to 
rails g Dungeon_intance dungeon:belongs_to did:integer last_update:datetime
rails g Boss_intance boss:belongs_to did:integer count:integer killed:booleans

rails g model currencies_headers name index:integer
rails g model currencies name did:integer index:integer

rails g model Inventory did:integer name quality:integer source category:integer itypy:integer is_collected:boolean is_hide_visual:boolean item:belongs_to stype:integer visaul_id:integer condition:boolean

rails g model source name did:integer inv_type:integer visual_id:integer category:integer nv_type:integer is_collected:boolean is_hide:boolean item_id:integer item_mod_id:integer quality:integer condition:boolean user_error description

rails g model appearance did:integer 

rails g model InventoryCategory did:integer name is_weapon:boolean can_enchant:boolean can_main_hand:boolean can_off_hand:boolean

rails g model item did:integer name item_class:integer item_sub_class:integer quality:integer inventory_type:integer sheathe_type:integer icon_file_data_id:integer level:integer min_level:integer stack_count:integer bind_type:integer set_id:integer

rails g model item_set 
 
rails g model Dungeon did:integer:index name description dtype:integer sub_type:integer faction:belongs_to

rails g model faction_group did:integer:index name internal_name mask_id:integer
rails g model faction did:integer:index name description parent:belongs_to 
rails g model item_class did:integer:index name
rails g model item_sub_class did:integer:index name parent:belongs_to


rails g model ChrClass name fname description icon_file_data_id:integer bg_color:integer
rails g model race name prefix_name fname description 
rails g scaffold character name last_update:datetime faction:belongs_to race:belongs_to level:integer chr_class:belongs_to money:integer gender:integer played:integer played_this_level:integer active_covenant:belongs_to last_logout:datetime zone sub_zone bind_location
rails g model item_set name flags:integer
rails g model item_set_member set:belongs_to item:belongs_to

rails g model item_appearance display_type:integer icon_file_data_id:integer order:integer player_condition_id:integer is_collected:boolean is_hide:boolean
rails g model item_appearance_items appearance:belongs_to item:belongs_to order:integer source_type:integer

rails g model transmog_set_group name 
rails g model transmog_set name class_mask:integer group:belongs_to flags tracking_quest:belongs_to item_name_description:belongs_to parent:belongs_to order:integer

rails g migration CreateJoinTableTransmogSetMember transmog_set item_appearance flags

https://github.com/Ketho/BlizzardInterfaceResources/blob/9.0.1/Resources/LuaEnum.lua

rails g model text 
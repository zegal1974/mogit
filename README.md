https://wowpedia.fandom.com/wiki/API_C_TransmogCollection.GetSourceInfo
https://wowpedia.fandom.com/wiki/API_C_TransmogSets.GetSetSources

rails g realm name
rails g guild name
rails g scaffold profiles name last_update:datetime faction:integer race:integer level:integer claxx:integer money:integer gender:integer played:integer played_this_level:integer active_covenant:belongs_to last_logout:datetime zone sub_zone bind_location

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

rails g model source name did:integer inv_type:integer visual_id:integer did:integer category:integer nv_type:integer is_collected:boolean is_hide:boolean item_id:integer item_mod_id:integer quality:integer condition:boolean user_error description

rails g model appearance did:integer 

rails g model InventoryCategory did:integer name is_weapon:boolean can_enchant:boolean can_main_hand:boolean can_off_hand:boolean

rails g model item did:integer name item_class:integer item_sub_class:integer quality:integer inventory_type:integer sheathe_type:integer icon_file_data_id:integer level:integer min_level:integer stack_count:integer bind_type:integer set_id:integer

rails g model item_set 
json.extract! character, :id, :name, :last_update, :faction_id, :race_id, :level, :chr_class_id, :money, :gender, :played, :played_this_level, :active_covenant_id, :last_logout, :zone, :sub_zone, :bind_location, :created_at, :updated_at
json.url character_url(character, format: :json)

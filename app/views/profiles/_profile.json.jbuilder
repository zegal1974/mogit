json.extract! profile, :id, :name, :last_update, :faction, :race, :level, :claxx, :money, :gender, :played, :played_this_level, :active_covenant_id, :last_logout, :zone, :sub_zone, :bind_location, :created_at, :updated_at
json.url profile_url(profile, format: :json)

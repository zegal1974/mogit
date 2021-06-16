namespace :wow do
  namespace :dbc do
    desc "Load WOW Items DB"
    task load_items: :environment do
      p "loading items"
    end
  end
end

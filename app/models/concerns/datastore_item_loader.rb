module DatastoreItemLoader
  extend ActiveSupport::Concern

  module ClassMethods
    include DatastoreLoader

    # def load_item_appearances
    #   lua = load_lua "DataStore_Characters.lua"
    # end
  end
end
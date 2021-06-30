module DsLoader
  extend DatastoreChrLoader
  extend DatastoreRepLoader

  def self.load_all
    load_characters
    load_reputations
  end
end

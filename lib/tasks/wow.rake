namespace :wow do
  namespace :dbc do
    desc "Load WOW all DBs"
    task all: :environment do
      DbcLoader::load_all
    end

    desc "load the WOW DB"
    task :load, [:category] => [:environment] do |t, args|
      # p "task: #{t} - #{args.category}"
      DbcLoader.send("load_#{args.category}")
    end
  end

  namespace :ds do
    desc "Load WOW all DataStore Data"
    task all: :environment do
      DsLoader::load_all
    end
  end
end
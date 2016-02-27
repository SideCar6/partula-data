require "bundler"
Bundler.require

namespace :db do
  task :environment do
    ActiveRecord::Base.establish_connection({
      adapter:  'mysql2',
      database:  ENV['DB_NAME'],
      username:  ENV['DB_USERNAME'],
      password:  ENV['DB_PASSWORD'],
      host:      ENV['DB_HOST'],
      port:      ENV['DB_PORT'],
      encoding:  'utf8',
      pool:      8,
    })
  end

  desc "Migrate the db"
  task :migrate => [:environment] do
    ActiveRecord::Migrator.migrate("db/migrate/")
  end

  desc "Create the db"
  task :create do
    ActiveRecord::Base.establish_connection({
      adapter:  'mysql2',
      username:  ENV['DB_USERNAME'],
      password:  ENV['DB_PASSWORD'],
      host:      ENV['DB_HOST'],
      port:      ENV['DB_PORT'],
      encoding:  'utf8',
      pool:      8,
    })

    ActiveRecord::Base.connection.create_database(ENV["DB_NAME"])
  end

  desc "drop the db"
  task :drop do
    ActiveRecord::Base.establish_connection({
      adapter:  'mysql2',
      username:  ENV['DB_USERNAME'],
      password:  ENV['DB_PASSWORD'],
      host:      ENV['DB_HOST'],
      port:      ENV['DB_PORT'],
      encoding:  'utf8',
      pool:      8,
    })

    ActiveRecord::Base.connection.drop_database(ENV["DB_NAME"])
  end

  desc "reset the db"
  task reset: [ :drop, :create, :migrate ]
end


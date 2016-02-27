require 'csv'
require 'json'
require 'bundler'
Bundler.require

require_relative 'app/models/given_name'
require_relative 'app/models/surname'

ActiveRecord::Base.establish_connection({
  adapter:  'mysql2',
  database:  ENV['DB_NAME'],
  username:  ENV['DB_USERNAME'],
  password:  ENV['DB_PASSWORD'],
  host:      ENV['DB_HOST'],
  port:      ENV['DB_PORT'],
  encoding:  'utf8',
  pool:      64,
})


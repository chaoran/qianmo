# Run with: rackup private_pub.ru -s thin -E production
require "bundler/setup"
require "yaml"
require "faye"
require "private_pub"
require 'active_record'

require File.expand_path("../app/models/profile.rb", __FILE__)

db_config = YAML::load( File.open(File.expand_path("../config/database.yml", __FILE__)))
ActiveRecord::Base.establish_connection( db_config["development"])

Faye::WebSocket.load_adapter('thin')

PrivatePub.load_config(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RAILS_ENV"] || "development")
server = PrivatePub.faye_app

server.bind :subscribe do |client_id, channel|
  if /\/user\/*/.match(channel)
    m = /\/user\/(?<user_id>\d+)/.match(channel)
    user_id = m[:user_id]
  end
  ActiveRecord::Base.transaction do
    puts Profile.all
  end
end

run server
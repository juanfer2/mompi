require 'dotenv/load'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

desc 'Run server'
task :server do
  ruby "#{__dir__}/app/app.rb"
end

task :test do
  ENV['RACK_ENV'] = ENV['APP_ENV'] = 'test'
  sh 'bundle exec rspec'
end

require 'dotenv/load'
require 'sysrandom/securerandom'
require 'sinatra'
require 'sinatra/activerecord'
require 'activerecord-postgres-earthdistance'
require 'sinatra/activerecord/rake'
require_relative 'app/services/application_service'
require 'pry'

desc 'Start set up project'
task :set_up do
  sh 'rake db:create'
  sh 'rake db:migrate'
  sh 'rake db:seed'
  sh 'APP_ENV=test rake db:test:prepare'
end

desc 'Run server'
task :server do
  ruby "#{__dir__}/app/app.rb"
end

desc 'Run tests'
task :test do
  sh 'rspec'
end

desc 'Generate secure key'
task :generate_key do
  puts SecureRandom.hex(64)
end

desc 'Linter for project'
task :lint do
  sh 'rubocop --auto-correct'
end


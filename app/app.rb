require 'pry'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require './config/credentials'
require './lib/wompi/wompi'
require './config/wompi_setting'
require_relative './utils/errors'
require_relative './utils/geo_localization'

current_dir = Dir.pwd
Dir["#{current_dir}/app/models/**/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/services/**/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/serializers/**/*.rb"].each { |file| require file }
Dir["#{current_dir}/app/controllers/**/*.rb"].each { |file| require file }


class MompiApp < ApplicationController
  use AuthController
  use RidersController
  use DriversController
end

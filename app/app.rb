require 'pry'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require_relative '../lib/wompi/wompi'
require_relative '../config/wompi_setting'
require_relative './utils/errors'
require_relative './utils/geo_localization'

# Time.zone = "America/Bogota"

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

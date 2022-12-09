require 'pry'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require_relative '../lib/wompi/wompi'
require_relative '../config/wompi_setting'
require_relative './utils/errors'
require_relative './services/application_service'
require_relative './controllers/applicatioin_controller'
require_relative './controllers/v1/users_controller'
require_relative './middlewares/auth_middleware'

class MompiApp < ApplicationController
  use UserController
end

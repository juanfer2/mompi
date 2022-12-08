require 'pry'
require 'sinatra'
require "sinatra/namespace"
require 'sinatra/activerecord'
require_relative '../lib/wompi/wompi'
require_relative '../config/wompi_setting'
require_relative './services/application_service'
require_relative './routes/route'

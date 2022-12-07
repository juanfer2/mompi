require 'sinatra'
require 'sinatra/activerecord'
require_relative '../lib/wompi/wompi'
require_relative '../config/wompi_setting'
require_relative './routes/route'

#w = Wompi.tokenization('nequi', {phone_number: '3005138128'})
w = WompiTokenization.new('nequi', { phone_number: '3005138128' }).create_token
  
puts w  
#w = Wompi::Tokenization.new('nequi', {phone_number: '3005138128'})
#w.create_token

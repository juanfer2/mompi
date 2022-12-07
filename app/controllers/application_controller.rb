# frozen_string_literal: true

require 'sinatra'
# require 'sinatra/json'
require 'rack/protection'

module Controllers
  # Base controller, handles the default route
  class ApplicationController < Sinatra::Application
    use Rack::Deflater
    use Rack::Protection
  end
end

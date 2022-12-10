require './app/app'

use Rack::Reloader unless settings.production?

run MompiApp

require_relative '../../app/app'

def app
  Rack::Lint.new(MompiApp)
end

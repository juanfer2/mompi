class RidersController < ApplicationController
  namespace '/api/v1/riders' do
    get '/me' do
      rider_protected!
  
      V1::RidersSerializer.new(current_user).as_json
    rescue ActiveRecord::RecordNotFound => e
      halt 404, { error: e.message }.to_json
    rescue => e
      halt 500, { error: e.message }.to_json
    end
  end
end

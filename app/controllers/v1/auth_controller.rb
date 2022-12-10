class AuthController < ApplicationController
  namespace '/api/v1/auth' do
    post '/rider/login' do  
      rider = Auth::LoginRiderService.call(@body['email'], @body['password'])

      V1::RiderSerializer.new(rider).as_json
    rescue ActiveRecord::RecordNotFound => e
      halt 404, { error: e.message }.to_json
    rescue => e
      halt 500, { error: e.message }.to_json
    end

    post '/driver/login' do
      driver_protected!

      V1::Driverserializer.new(current_driver).as_json
    rescue ActiveRecord::RecordNotFound => e
      halt 404, { error: e.message }.to_json
    rescue => e
      halt 500, { error: e.message }.to_json
    end
  end
end

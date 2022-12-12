class RidersController < ApplicationController
  namespace '/api/v1/riders' do
    post '/rides' do
      rider_protected!

      @ride = V1::Rides::CreateService.call(current_rider, params_body['currentLocationLatitude'],
        params_body['currentLocationLongitude'])

      V1::RideSerializer.new(@ride).as_json
    rescue ActiveRecord::RecordNotFound => e
      halt 404, { error: e.message }.to_json
    rescue Api::ParamsError => e
      halt 403, { error: e.message }.to_json
    rescue => e
      halt 500, { error: e.message }.to_json
    end

    post '/rides/:id/pay' do
      rider_protected!
      @ride = V1::Rides::PayService.call(current_rider, params['id'].to_i,
        params_body['paymentSourceId'].to_i)

      V1::RideSerializer.new(@ride).as_json
    rescue ActiveRecord::RecordNotFound => e
      halt 404, { error: e.message }.to_json
    rescue Api::ParamsError => e
      halt 403, { error: e.message }.to_json
    rescue => e
      halt 500, { error: e.message }.to_json
    end
  end
end

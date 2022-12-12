class DriversController < ApplicationController
  namespace '/api/v1/drivers' do
    post '/rides/:id/finished' do
      driver_protected!

      @ride = V1::Rides::FinishedService.call(current_driver, params['id'],
        params_body['currentLocationLatitude'], params_body['currentLocationLongitude'])
    
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

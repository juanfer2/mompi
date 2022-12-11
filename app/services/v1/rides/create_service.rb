module V1
  module Rides
    class CreateService < ApplicationService
      def initialize(current_rider, current_location_latitude, current_location_longitude)
        @current_rider = current_rider
        @current_location_latitude = current_location_latitude
        @current_location_longitude = current_location_longitude
      end

      def call
        if ride.save
          ride
        end
      end

      private

      def ride
        @ride ||= begin
          Ride.new(rider_id: @current_rider.id, start_location_latitude: @current_location_latitude,
            start_location_longitude: @current_location_longitude, base_fee: 3500)
        end
      end
    end
  end
end

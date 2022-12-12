module V1
  module Rides
    class CreateService < ApplicationService
      def initialize(current_rider, current_location_latitude, current_location_longitude)
        @current_rider = current_rider
        @current_location_latitude = current_location_latitude
        @current_location_longitude = current_location_longitude
      end

      def call
        V1::Rides::ValidateCurrentLocationService.call(current_location)

        raise Api::RideError.new("#{ride.errors.full_messages.join(', ')}") unless ride.save  

        ride
      end

      def current_location
        @current_location ||= begin
          GeoLocalization.new(@current_location_latitude, @current_location_longitude)
        end
      end

      def ride
        @ride ||= begin
          Ride.new(rider_id: @current_rider.id, driver_id: driver.id,
            start_location_latitude: current_location.latitude, status: :active,
            start_location_longitude: current_location.longitude, base_fee: 3500,
            start_at: DateTime.current.utc)
        end
      end

      def driver
        @driver ||= Driver.first
      end
    end
  end
end

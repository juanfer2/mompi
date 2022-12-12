module V1
  module Rides
    class FinishedService < ApplicationService
      def initialize(current_driver, ride_id, current_location_latitude, current_location_longitude)
        @current_driver = current_driver
        @ride_id = ride_id.to_i
        @current_location_latitude = current_location_latitude
        @current_location_longitude = current_location_longitude
      end

      def call
        V1::Rides::ValidateCurrentLocationService.call(current_location)
        raise Api::RideError.new("Ride ##{ride.id} was finished") if ride.finished?

        ride.kilometers = distance_kilometers
        ride.end_location_latitude = current_location.latitude
        ride.end_location_longitude = current_location.longitude
        ride.end_at = DateTime.current.utc
        ride.total_price_kilometer = pricing[:total_price_kilometer]
        ride.total_price_time = pricing[:total_price_time]
        ride.total = pricing[:total]
        ride.status = :finished

        raise Api::RideError.new("#{ride.errors.full_messages.join(', ')}") unless ride.save

        ride
      end

      private

      def start_location
        @start_location ||= begin
          GeoLocalization.new(ride.start_location_latitude, ride.start_location_longitude)
        end
      end

      def current_location
        @current_location ||= begin
          GeoLocalization.new(@current_location_latitude, @current_location_longitude)
        end  
      end

      def ride
        @ride ||= @current_driver.rides.find(@ride_id)
      end

      def distance_kilometers
        CalculateDistanceService.call(start_location, current_location)
      end

      def pricing
        V1::Rides::CalculatePricingService.call(ride)
      end
    end
  end
end

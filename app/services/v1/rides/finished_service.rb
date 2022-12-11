module V1
  module Rides
    class FinishedService < ApplicationService
      def initialize(current_driver, ride_id, end_location_latitude, end_location_longitude)
        @current_driver = current_driver
        @ride_id = ride_id.to_i
        @end_location_latitude = end_location_latitude
        @end_location_longitude = end_location_longitude
      end

      def call
        ride.kilometers = distance_kilometers
        ride.end_at = DateTime.current.utc        
        ride.total_kilometer_fee = fees[:total_kilometer_fee]
        ride.total_time_fee = fees[:total_time_fee]
        ride.total = fees[:total]
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

      def end_location
        @end_location ||= begin
          GeoLocalization.new(@end_location_latitude, @end_location_longitude)
        end  
      end

      def ride
        @ride ||= @current_driver.rides.find(@ride_id)
      end

      def total_kilometer_feed

      end

      def total_time_fee
        
      end

      def distance_kilometers
        CalculateDistanceService.call(start_location, end_location)
      end

      def fees
        V1::Rides::CalculateFeesService.call(ride)
      end
    end
  end
end

module V1
  module Rides
    class AceptService < ApplicationService
      def initialize(current_driver, ride_id)
        @current_driver = current_driver
        @ride_id = ride_id
      end

      def call
        ride.drive_id = @current_driver.id
        ride.status = active

        ride.save!
      end

      def current_localization
        @current_localization ||= begin
          GeoLocalization.new(@current_location_latitude, @current_location_longitude)
        end
      end

      def ride
        @ride ||= ride.find_by!(id: ride_id, status: :pending)
      end
    end
  end
end

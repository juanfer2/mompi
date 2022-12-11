module V1
  module Rides
    class CreateService < ApplicationService
      def initialize(current_rider, current_location_latitude, current_location_longitude)
        @current_rider = current_rider
        @current_location_latitude = current_location_latitude
        @current_location_longitude = current_location_longitude
      end

      def call
        unless current_localization.latitude.present?
          raise Api::ParamsError.new('currentLocationLatitude is required')
        end

        unless current_localization.longitude.present?
          raise Api::ParamsError.new('currentLocationLongitude is required')
        end

        unless current_localization.longitude_is_valid?
          raise Api::ParamsError.new('longitude is invalid')
        end

        unless current_localization.latitude_is_valid?
          raise Api::ParamsError.new('latitude is invalid')
        end

        raise Api::RideError.new("#{ride.errors.full_messages.join(', ')}") unless ride.save  

        ride
      end

      def current_localization
        @current_localization ||= begin
          GeoLocalization.new(@current_location_latitude, @current_location_longitude)
        end
      end

      def ride
        @ride ||= begin
          Ride.new(rider_id: @current_rider.id, driver_id: driver.id,
            start_location_latitude: current_localization.latitude, status: :active,
            start_location_longitude: current_localization.longitude, base_fee: 3500,
            start_at: DateTime.current.utc)
        end
      end

      def driver
        @driver ||= Driver.first
      end
    end
  end
end

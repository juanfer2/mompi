module V1
  module Rides
    class ValidateCurrentLocationService < ApplicationService
      def initialize(current_location)
        @current_location = current_location
      end

      def call
        unless @current_location.latitude.present?
          raise Api::ParamsError.new('currentLocationLatitude is required')
        end

        unless @current_location.longitude.present?
          raise Api::ParamsError.new('currentLocationLongitude is required')
        end

        unless @current_location.longitude_is_valid?
          raise Api::ParamsError.new('longitude is invalid')
        end

        unless @current_location.latitude_is_valid?
          raise Api::ParamsError.new('latitude is invalid')
        end
      end
    end
  end
end

class CalculateDistanceService < ApplicationService
  KILOMETERS = 6371
  METERS = KILOMETERS * 1000
  
  def initialize(start_location, end_location)
    @start_location = start_location
    @end_location = end_location
  end

  def call
    radius_per_deg = Math::PI / 180
  
    delta_lat_radius = (@end_location.latitude - @start_location.latitude) * radius_per_deg # Delta, converted to rad
    delta_lon_radius = (@end_location.longitude - @start_location.longitude) * radius_per_deg
  
    start_latitude_radius = @start_location.latitude * radius_per_deg
    end_latitude_radius = @end_location.latitude * radius_per_deg
  
    result = Math.sin(delta_lat_radius / 2)**2 + Math.cos(start_latitude_radius) * Math.cos(end_latitude_radius) * Math.sin(delta_lon_radius / 2)**2

    KILOMETERS * (2 * Math::atan2(Math::sqrt(result), Math::sqrt(1 - result))).round(2)
  end
end

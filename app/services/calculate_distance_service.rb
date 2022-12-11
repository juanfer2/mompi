class CalculateDistanceService < ApplicationService
  KILOMETERS = 6371
  
  def initialize(start_location, end_location)
    @start_location = start_location
    @end_location = end_location
  end

  def call
    radius_per_deg = Math::PI/180
  
    delta_lat_radius = (@end_location.latitude - @start_location.latitude) * radius_per_deg # Delta, converted to rad
    delta_lon_radius = (@end_location.longitude - @start_location.longitude) * radius_per_deg
  
    start_latitude_radiues = @start_location.latitude * radius_per_deg
    end_latitude_radiues = @end_location.longitude * radius_per_deg
  
    a = Math.sin(delta_lat_radius/2)**2 + Math.cos(start_latitude_radiues) * Math.cos(end_latitude_radiues) * Math.sin(delta_lon_radius/2)**2

    KILOMETERS * (2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a)))  
  end
end

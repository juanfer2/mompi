class GeoLocalization
  attr_accessor :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude.to_f
    @longitude = longitude.to_f
  end

  def location_is_valid?
    latitude_is_valid? && longitude_is_valid?
  end

  def latitude_is_valid?
    latitude.to_s =~ lat_lon_regex
  end

  def longitude_is_valid?
    longitude.to_s =~ lat_lon_regex
  end

  def lat_lon_regex
    /^(\+|-)?((\d((\.)|\.\d{1,6})?)|(0*?[0-8]\d((\.)|\.\d{1,6})?)|(0*?90((\.)|\.0{1,6})?))$/
  end
end

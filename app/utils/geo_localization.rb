class GeoLocalization
  attr_accessor :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def location_is_valid?
    latitude_is_valid? && longitude_is_valid?
  end

  def latitude_is_valid?
    latitude.to_s =~ /^-?([1-8]?\d(?:\.\d{1,})?|90(?:\.0{1,6})?)$/
  end

  def longitude_is_valid?
    longitude.to_s =~ /^-?((?:1[0-7]|[1-9])?\d(?:\.\d{1,})?|180(?:\.0{1,})?)$/
  end

  def lat_lon_regex
    /^(\+|-)?((\d((\.)|\.\d{1,6})?)|(0*?[0-8]\d((\.)|\.\d{1,6})?)|(0*?90((\.)|\.0{1,6})?))$/
  end
end

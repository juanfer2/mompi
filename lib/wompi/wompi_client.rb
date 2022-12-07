require 'httparty'

class WompiClient
  def initialize
    
  end

  def headers
    {
      'Authorization': "Bearer #{token}"
    }
  end
end

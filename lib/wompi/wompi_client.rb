class WompiClient
  class << self
    def fetch(method, url, body)
      HTTParty.post("#{base_url}/#{url}", body: body.to_json, headers: headers)
    end

    def token
      WompiSetting.configuration.token
    end

    def base_url
      WompiSetting.configuration.url
    end

    def headers
      {
        'Authorization': "Bearer #{token}"
      }
    end
  end
end

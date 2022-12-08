class WompiClient
  class << self
    def fetch(method, url, body = {}, private_key: false)
      HTTParty.send(method,"#{base_url}/#{url}", body: body.to_json,
        headers: headers(private_key: private_key))
    end

    def get_token_acceptations
      HTTParty.get("#{base_url}/merchants/#{public_key}", headers: headers(private_key: true))
    end

    private

    def private_key
      WompiSetting.configuration.private_key
    end

    def public_key
      WompiSetting.configuration.public_key
    end

    def base_url
      WompiSetting.configuration.url
    end

    def headers(private_key: false)
      {
        'Authorization': "Bearer #{private_key ? private_key : public_key}"
      }
    end
  end
end

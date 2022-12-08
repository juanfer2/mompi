require 'httparty'
require_relative 'wompi_setting'
require_relative 'wompi_configuration'
require_relative 'wompi_client'
require_relative 'wompi_tokenization'
require_relative 'products/nequi'
require_relative 'products/credit_card'

class Wompi
  class << self
    def tokenization_product(kind_product, product)
      WompiTokenization.create_token(kind_product, product)
    end

    def presigned_acceptance
      response = WompiClient.get_token_acceptations

      response['data']['presigned_acceptance']
    end
  end
end

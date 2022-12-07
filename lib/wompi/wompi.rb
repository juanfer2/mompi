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
      WompiTokenization.new(kind_product, product).create_token
    end
  end
end

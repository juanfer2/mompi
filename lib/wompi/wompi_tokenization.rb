class WompiTokenization
  class << self
    def create_token(kind_product, product)
      WompiClient.fetch('post', url(kind_product),
        class_product(kind_product, product).to_data_json)
    end

    def find_product_by_token(token)
      WompiClient.fetch('get', "#{url(kind_product)}/#{token}")
    end

    private

    def url(kind_product)
      kind_product == 'nequi' ? 'tokens/nequi' : 'tokens/cards'
    end

    def class_product(kind_product, product)
      if kind_product == 'nequi'
        Products::Nequi.new(**product)
      else
        Products::CreditCard.new(**product)
      end
    end
  end
end

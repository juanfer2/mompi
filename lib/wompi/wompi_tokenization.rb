class WompiTokenization
  def initialize(kind_product, product)
    @kind_product = kind_product
    @product = product
  end

  def create_token
    WompiClient.fetch('post', url, class_product.to_data_json)
  end

  def url
    @kind_product == 'nequi' ? 'tokens/nequi' : 'tokens/cards'
  end

  def class_product
    if @kind_product == 'nequi'
      Products::Nequi.new(@product)
    else
      Products::CreditCard.new(@product)
    end
  end
end

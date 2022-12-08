class WompiPaymentSource
  def initialize(type, token, customer_email, acceptance_token)
    @type = type.to_s.upcase
    @token = token 
    @customer_email = customer_email
    @acceptance_token = acceptance_token
  end

  def create_payment_source
    response = WompiClient.fetch('post', 'payment_sources', body, use_private_key: true)

    response['data']
  end

  def body
    { type: @type, token: @token,  customer_email: @customer_email,
      acceptance_token: @acceptance_token }
  end
end

class WompiTransaction
  attr_accessor :amount_in_cents, :currency, :customer_email, :installments, :reference,
    :payment_source_id

  def initialize(amount_in_cents, currency, customer_email, installments, reference,
    payment_source_id)
    @amount_in_cents = amount_in_cents
    @currency = currency
    @customer_email = customer_email
    @installments = installments
    @reference = reference
    @payment_source_id = payment_source_id
  end

  def exec
    WompiClient.fetch('post', 'transactions', body, use_private_key: false)
  end

  def body
    {
      amount_in_cents: @amount_in_cents, currency: @currency, customer_email: @customer_email,
      payment_method: { installments: @installments }, reference: @reference,
      payment_source_id: @payment_source_id
    }
  end
end

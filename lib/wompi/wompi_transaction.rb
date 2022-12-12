class WompiTransaction
  #"amount_in_cents": 4990000, // Monto en centavos
  #"currency": "COP", // Moneda
  #"customer_email": "example@gmail.com", // Email del usuario
  #"payment_method": {
  #  "installments": 2 // Número de cuotas si la fuente de pago representa una tarjeta de lo contrario el campo payment_method puede ser ignorado.
  #},
  #"reference": "sJK4489dDjkd390ds02", // Referencia única de pago
  #"payment_source_id": 3891 // ID de la fuente de pago

  def initialize(amount_in_cents, currency, customer_email, payment_method, reference,
    payment_source_id)
    @amount_in_cents = amount_in_cents
    @currency = currency
    @customer_email = customer_email
    @payment_method = payment_method
    @reference = reference
    @payment_source_id = payment_source_id
  end

  def exec
    WompiClient.fetch('post', 'transactions', body, use_private_key: true)
  end

  def body
    {
      amount_in_cents: @amount_in_cents, currency: @currency, customer_email: @customer_email,
      payment_method: @payment_method, reference: @reference, payment_source_id: @payment_source_id
    }
  end
end

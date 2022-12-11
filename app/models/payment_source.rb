class PaymentSource < ActiveRecord::Base
  belongs_to :rider

  enum kind: { card: 'card', nequi: 'nequi' }
end

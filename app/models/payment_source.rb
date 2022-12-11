class PaymentSource < ActiveRecord::Base
  belongs_to :rider

  enum kind: { card: 'card', nequi: 'nequi' }

  validates :name, :token_aceptation, :token_id, presence: true
end

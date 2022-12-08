class PaymentSource < ActiveRecord::Base
  belongs_to :user

  enum kind: [:card, :nequi]

  validates :name, :token_aceptation, :token_id, presence: true
end

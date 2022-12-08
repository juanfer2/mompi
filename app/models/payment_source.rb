class PaymentSource < ActiveRecord::Base
  belongs_to :user

  validates :name, :token_aceptation, :token_id, presence: true
end

class Ride < ActiveRecord::Base
  belongs_to :rider
  belongs_to :driver, optional: true

  validates :name, :token_aceptation, :token_id, presence: true
end

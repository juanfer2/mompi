class RidePayment < ActiveRecord::Base
  belongs_to :ride

  enum status: { pending: 'pending', active: 'active', finished: 'finished', canceled: 'canceled'}

  validates :status, :resource_id, presence: true
end

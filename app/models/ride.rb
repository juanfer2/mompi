class Ride < ActiveRecord::Base
  belongs_to :rider
  belongs_to :driver, optional: true

  has_many :rides, dependent: :destroy

  enum status: { pending: 'pending', active: 'active', finished: 'finished', canceled: 'canceled'}
  enum payment_status: { waiting: 'waiting', success: 'success', failed: 'failed' }

  validates :start_location_latitude, :start_location_longitude, :base_fee, :status, presence: true
end

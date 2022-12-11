class Ride < ActiveRecord::Base
  belongs_to :rider
  belongs_to :driver, optional: true

  enum status: { pending: 'pending', active: 'active', finished: 'finished', canceled: 'canceled'}

  validates :start_location_latitude, :start_location_longitude, :base_fee, presence: true
end

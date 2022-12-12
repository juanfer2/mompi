class RidePayment < ActiveRecord::Base
  belongs_to :ride

  enum status: { pending: 'pending', success: 'success', failed: 'failed' }

  validates :status, :resource_id, presence: true
end

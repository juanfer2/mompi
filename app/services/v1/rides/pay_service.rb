module V1
  module Rides
    class PayService < ApplicationService
      PAYMENT_STATUS = {'PENDING': :waiting, 'APPROVED': :approved, 'DECLINED': :failed,
        'ERROR': :error}

      def initialize(current_rider, ride_id, payment_source_id)
        @current_rider = current_rider
        @ride_id = ride_id
        @payment_source_id = payment_source_id
      end

      def call
        raise Api::RideError.new("Ride ##{ride.id} must be finished") unless ride.finished?
        raise Api::RideError.new("Ride ##{ride.id} was paid") unless ride.success?
        response = Wompi.transaction(amount_in_cents: ride.total.to_i, currency: ride.currency,
          customer_email: @current_rider.email, installments: 1,
          reference: "#{ride.id}_#{DateTime.current.to_i}",
          payment_source_id: payment_source.resource_id)

        payment_status = PAYMENT_STATUS[response['status']] || :failed
        RidePayment.create(ride_id: ride.id, status: payment_status,
          resource_id: response['id'])

        ride.payment_status = payment_status
      
        raise Api::RideError.new("#{ride.errors.full_messages.join(', ')}") unless ride.save

        ride
      end

      private


      def ride
        @ride ||= @current_rider.rides.find(@ride_id)
      end

      def payment_source
        @payment_source ||= @current_rider.payment_sources.find(@payment_source_id)
      end
    end
  end
end

module V1
  module Rides
    class PayService < ApplicationService
      def initialize(current_rider, ride_id, payment_source_id)
        @current_rider = current_rider
        @ride_id = ride_id
        @payment_source_id = payment_source_id
      end

      def call
        response = Wompi.transaction(amount_in_cents: ride.total.to_i, currency: ride.currency,
          customer_email: @current_rider.email, installments: 1,
          reference: "#{ride.id}_#{DateTime.current.to_i}",
          payment_source_id: payment_source.resource_id)

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

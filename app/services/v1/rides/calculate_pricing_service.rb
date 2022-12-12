module V1
  module Rides
    class CalculatePricingService < ApplicationService
      MINUTE_PRICE = 200 
      KILOMETER_PRICE = 1000 

      def initialize(ride)
        @ride = ride
      end

      def call
        total_price_time =  minutes_elapsed * MINUTE_PRICE
        total_price_kilometer = @ride.kilometers * KILOMETER_PRICE

        { total:@ride.base_fee + total_price_time + total_price_kilometer,
          total_price_time: total_price_time, total_price_kilometer: total_price_kilometer }
      end

      def minutes_elapsed
        (@ride.end_at - @ride.start_at) / 1.minutes
      end
    end
  end
end

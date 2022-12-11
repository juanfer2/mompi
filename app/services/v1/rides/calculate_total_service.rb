module V1
  module Rides
    class CalculateFeesService < ApplicationService
      MINUTE_PRICE = 200 
      KILOMETER_PRICE = 1000 

      def initialize(ride)
        @ride = ride
      end

      def call
        total_time_fee =  minutes_elapsed * MINUTE_PRICE
        total_kilometer_fee = @ride.kilometers * KILOMETER_PRICE

        { total:@ride.base_fee + total_time_fee + total_kilometer_fee,
          total_time_fee: total_time_fee, total_kilometer_fee: total_kilometer_fee }
      end

      def minutes_elapsed
        (@ride.end_at - @ride.start_at) / 1.minutes
      end
    end
  end
end

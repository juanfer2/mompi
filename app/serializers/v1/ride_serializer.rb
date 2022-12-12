require 'money'

module V1
  class RideSerializer
    def initialize(ride)
      @ride = ride
    end

    def as_json
      {
        id: @ride.id,
        rider: rider,
        driver: driver,
        status: @ride.status,
        start_location_latitude: @ride.start_location_latitude,
        start_location_longitude: @ride.start_location_longitude,
        end_location_latitude: @ride.end_location_latitude,
        end_location_longitude: @ride.end_location_longitude,
        start_at: @ride.start_at,
        end_at: @ride.end_at,
        kilometers: "#{@ride.kilometers} km",
        currency: 'COP',
        total_price_kilometer: convert_to_pesos(@ride.total_price_kilometer),
        total_price_time: convert_to_pesos(@ride.total_price_time),
        base_fee: convert_to_pesos(@ride.base_fee),
        total: convert_to_pesos(@ride.total)
      }.to_json
    end

    private

    def convert_to_pesos(price)
      Money.from_cents(price, "COP").format({ separator: ",", delimiter: ".", symbol: "$ "}) if price
    end

    def driver
      {
        id: @ride.driver.id,
        name: @ride.driver.name,
        number_plate: @ride.driver.number_plate,
      }
    end

    def rider
      {
        id: @ride.rider.id,
        name: @ride.rider.name
      }
    end
  end
end

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
        kilometers: @ride.kilometers,
        total_kilometer_fee: @ride.total_kilometer_fee,
        total_time_fee: @ride.total_time_fee,
        base_fee: @ride.base_fee,
        total: @ride.total
      }.to_json
    end

    private

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

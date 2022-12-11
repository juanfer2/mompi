module V1
  class RideSerializer
    def initialize(ride)
      @ride = ride
    end

    def as_json
      {
        id: @ride.id,
        rider: rider,
        driver: @ride.driver,
        status: @ride.status,
        start_location_latitude: @ride.start_location_latitude,
        start_location_longitude: @ride.start_location_longitude,
        end_location_latitude: @ride.end_location_latitude,
        end_location_longitude: @ride.end_location_longitude,
        start_at: @ride.start_at,
        end_at: @ride.end_at,
        kilometres: @ride.kilometres,
        base_fee: @ride.base_fee,
        total: @ride.total
      }.to_json
    end

    private

    def driver
      {
        id: @ride.drive.id,
        name: @ride.drive.name,
        number_plate: @ride.drive.number_plate,
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

module V1
  class RiderSerializer
    def initialize(rider)
      @rider = rider
    end

    def as_json
      {
        id: @rider.id,
        name: @rider.name,
        email: @rider.email,
        token: @rider.token
      }.to_json
    end
  end
end

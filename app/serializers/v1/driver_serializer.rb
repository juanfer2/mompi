module V1
  class DriverSerializer
    def initialize(user)
      @user = user
    end

    def as_json
      {
        id: @user.id,
        name: @user.name,
        number_plate: @user.number_plate,
        token: @user.token
      }.to_json
    end
  end
end

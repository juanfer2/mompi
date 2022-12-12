module Auth
  class LoginDriverService < ApplicationService
    def initialize(email, password)
      @email = email
      @password = password
    end

    def call
      rider = Rider.find_by(email: @email)

      if rider && rider.password == @password
        rider
      else
        raise Api::RiderError.new('Email or password incorrect')
      end
    end
  end
end

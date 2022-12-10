module V1
  module Riders
    class CreateService < ApplicationService
      def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
      end

      def call
        rider = Rider.new(name: @name, email: @email)
        rider.password = @password

        if rider.save
          rider.generate_token
          rider.save

          rider
        else
          raise Api::RiderError.new("#{rider.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end

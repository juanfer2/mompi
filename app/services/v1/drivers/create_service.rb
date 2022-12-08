require_relative '../../../models/driver'

module V1
  module Drivers
    class CreateService < ApplicationService
      def initialize(name, number_plate, password)
        @name = name
        @number_plate = number_plate
        @password = password
      end

      def call
        driver = Driver.new(name: @name, number_plate: @number_plate)
        driver.password = @password

        if driver.save
          driver.generate_token
          driver.save

          driver
        else
          raise Api::DriverError.new("#{driver.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end

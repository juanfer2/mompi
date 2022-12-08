require_relative '../../../models/user'

module V1
  module Users
    class CreateService < ApplicationService
      def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
      end

      def call
        user = User.new(name: @name, email: @email)
        user.password = @password

        if user.save
          user.generate_token
          user.save

          user
        else
          raise Api::UserError.new("#{user.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end

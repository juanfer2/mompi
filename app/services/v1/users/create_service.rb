require_relative '../../../utils/auth_jwt'
require_relative '../../../utils/errors'
require_relative '../../../models/user'

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

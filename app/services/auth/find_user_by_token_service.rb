require_relative '../../models/user'

module Auth
  class FindUserByTokenService < ApplicationService
    def initialize(token)
      @token = token
    end

    def call
      User.find_by(token: @token)
    end
  end
end

require_relative '../../models/driver'

module Auth
  class FindDriverByTokenService < ApplicationService
    def initialize(token)
      @token = token
    end

    def call
      Driver.find_by(token: @token)
    end
  end
end

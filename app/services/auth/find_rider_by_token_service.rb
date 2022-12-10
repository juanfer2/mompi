module Auth
  class FindRiderByTokenService < ApplicationService
    def initialize(token)
      @token = token
    end

    def call
      Rider.find_by(token: @token)
    end
  end
end

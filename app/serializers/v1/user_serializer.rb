module V1
  class UserSerializer
    def initialize(user)
      @user = user
    end

    def as_json
      {
        id: @user.id,
        name: @user.name,
        email: @user.email,
        token: @user.token
      }
    end
  end
end

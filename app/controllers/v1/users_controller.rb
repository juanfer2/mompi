require_relative '../../models/user'
require_relative '../../services/v1/users/create_service'
require_relative '../../serializers/v1/user_serializer'

namespace '/api/v1/users' do
  post '' do
    user = V1::Users::CreateService.call(@body['name'], @body['email'], @body['password'])

    V1::UserSerializer.new(user).as_json
  rescue Api::UserError => e
    halt 400 { error: e.message }.to_json
  rescue => e
    halt 500 { error: e.message }.to_json
  end

  get '/:id' do
    user_protected!
    user = User.find(params[:id])

    V1::UserSerializer.new(user).as_json
  rescue ActiveRecord::RecordNotFound => e
    halt 404 { error: e.message }.to_json
  rescue => e
    halt 500 { error: e.message }.to_json
  end
end

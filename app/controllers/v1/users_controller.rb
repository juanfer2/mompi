require_relative '../../models/user'
require_relative '../../services/v1/users/create_service'
require_relative '../../serializers/v1/user_serializer'

namespace '/api/v1/users' do
  post '' do
    user = Users::CreateService.call(@body['name'], @body['email'], @body['password'])

    { data: V1::UserSerializer.new(user).as_json }.to_json
  rescue Api::UserError => e
    status 400
    { error: e.message }.to_json
  rescue => e
    status 500
    { error: e.message }.to_json
  end

  get '/:id' do
    User.find(params[:id]).to_json
  rescue ActiveRecord::RecordNotFound => e
    status 404
    { error: e.message }.to_json
  rescue => e
    status 500
    { error: e.message }.to_json
  end
end

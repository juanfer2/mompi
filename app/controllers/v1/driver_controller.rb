namespace '/api/v1/drivers' do
  post '' do
    user = V1::Drivers::CreateService.call(@body['name'], @body['email'], @body['password'])
  
    V1::Driverserializer.new(user).as_json
  rescue Api::UserError => e
    status 400
    { error: e.message }.to_json
  rescue => e
    status 500
    { error: e.message }.to_json
  end

  get '/:id' do
    user_protected!
    user = User.find(params[:id])

    V1::Driverserializer.new(user).as_json
  rescue ActiveRecord::RecordNotFound => e
    status 404
    { error: e.message }.to_json
  rescue => e
    status 500
    { error: e.message }.to_json
  end
end

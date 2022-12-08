require_relative '../services/auth/find_user_by_token_service'
require_relative '../services/auth/find_driver_by_token_service'

helpers do
  def user_protected!
    halt 403, { error: 'user is unauthorize' }.to_json unless current_user
  end

  def driver_protected!
    halt 403, { error: 'driver is unauthorize' }.to_json unless current_driver
  end

  def current_driver
    @current_user ||= begin
      header_token = request.env['HTTP_AUTHORIZATION'].split(' ')

      Auth::FindDriverByTokenService.call(header_token[1])
    end
  end

  def current_user
    @current_user ||= begin
      header_token = request.env['HTTP_AUTHORIZATION'].split(' ')

      Auth::FindUserByTokenService.call(header_token[1])
    end
  end
end

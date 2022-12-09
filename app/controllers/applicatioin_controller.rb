class ApplicationController < Sinatra::Base
  def user_protected!
    halt 403, { error: 'user is unauthorize' }.to_json unless current_user
  end

  def driver_protected!
    halt 403, { error: 'driver is unauthorize' }.to_json unless current_driver
  end

  def current_driver
    @current_user ||= begin
      Auth::FindDriverByTokenService.call(token)
    end
  end

  def current_user
    @current_user ||= begin
      Auth::FindUserByTokenService.call(token)
    end
  end

  def token
    request.env['HTTP_AUTHORIZATION']&.split(' ')&.last
  end
end

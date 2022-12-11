class ApplicationController < Sinatra::Base
  register Sinatra::Namespace

  private

  def params_body
    @params_body ||= begin
      JSON.parse(request.body.read)
    rescue
      { }
    end
  end

  def rider_protected!
    halt 403, { error: 'rider is unauthorize' }.to_json unless current_rider
  end

  def driver_protected!
    halt 403, { error: 'driver is unauthorize' }.to_json unless current_driver
  end

  def current_driver
    @current_driver ||= Auth::FindDriverByTokenService.call(token)
  end

  def current_rider
    @current_rider ||= Auth::FindRiderByTokenService.call(token)
  end

  def token
    request.env['HTTP_AUTHORIZATION']&.split(' ')&.last
  end
end

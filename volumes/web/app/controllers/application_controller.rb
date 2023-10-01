class ApplicationController < ActionController::Base
  DEFAULT_AGE = 10.minutes

  before_action :no_cache

  def no_cache
    response.headers['Cache-Control'] =
      'private, no-store, no-cache, must-revalidate, post-check=0, pre-check=0'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Thu, 19 Nov 1981 08:52:00 GMT'
  end

  def enable_cache
    minutes = DEFAULT_AGE
    response.headers['Cache-Control'] = "public, max-age=#{minutes}"
    response.headers['Expires'] = minutes.from_now.httpdate
  end
end

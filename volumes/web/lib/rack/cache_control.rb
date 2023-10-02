module Rack
  class CacheControl
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      headers.delete("set-cookie") if headers["cache-control"].to_s["public"]
      [status, headers, response]
    end
  end
end

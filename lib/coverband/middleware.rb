module Coverband
  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)
      Coverband::Base.instance.configure_sampling
      Coverband::Base.instance.record_coverage
      @app.call(env)
    rescue
      # we don't want to interrupt web request with any error from this gem
    end

  end
end

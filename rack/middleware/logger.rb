require 'logger'

class Logger
  def initialize(app, **options)
    @app = app
    @logger = Logger.new(options[:logdev] || $stdout)
  end

  def call(env)
    @logger.info(env)
    @app.call(env)
  end
end

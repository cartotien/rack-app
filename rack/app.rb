require_relative 'format_parser'

class App
  def call(env)
    @request = Rack::Request.new(env)

    response_handler
    [status, headers, body]
  end

  private

  def response_handler
    return invalid_response if @request.path_info != '/time' || @request.query_string.empty?

    @parser = FormatParser.new(@request)
    @parser.format_valid? ? valid_format_response : invalid_format_response
  end

  attr_reader :status

  def headers
    { "Content-Type" => "text/plain" }
  end

  def body
    [@content]
  end

  def valid_format_response
    @status = 200
    @content = @parser.parsed_formats
  end

  def invalid_format_response
    @status = 400
    @content = "Unknown format: #{@parser.errors}"
  end

  def invalid_response
    @status = 404
    @content = "Not found."
  end
end

class FormatParser
  ALLOWED_TIME_METHODS = %w[year hour minute day second month]

  attr_reader :errors

  def initialize(params)
    @parsed_query_string = params['format'].split(',')
    @errors = @parsed_query_string - ALLOWED_TIME_METHODS
  end

  def parsed_formats
    @parsed_formats ||= parse_formats(@parsed_query_string)
  end

  def format_valid?
    @errors.empty?
  end

  private

  def parse_formats(format)
    parsed_formats = format.map do |t|
      Time.now.public_send(t.to_sym)
    end
    parsed_formats.join('-')
  end
end

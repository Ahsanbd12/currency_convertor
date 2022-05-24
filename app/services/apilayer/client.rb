class Apilayer::Client
  include HTTParty

  base_uri 'https://api.apilayer.com'

  def get(url, options = {})
    error_or_response(self.class.get(url, options))
  end

  def auth_headers
    {
      "apikey": "test"
    }
  end

  def error_or_response(response)
    status = response.code
    respond_with_error(status, response) if status.between?(400,
                                                            599) || (response.respond_to?(:has_key?) && response.key?('error'))
    response
  end

  def respond_with_error(code, body)
    code ||= 422
    message = body.message || 'Something went wrong'
    raise Apilayer::Error.new(code, message)
  end
end

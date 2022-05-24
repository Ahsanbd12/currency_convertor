class Apilayer::Error < StandardError
  attr_reader :code, :message

  def initialize(code = nil, message = nil)
    super()
    @code = code || 422
    @message = message || 'Something went wrong'
  end
end
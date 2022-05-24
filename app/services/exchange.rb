class Exchange
  attr_accessor :client

  def initialize
    @client = Apilayer::Client.new
  end

  def get_rate(from, to)
    options = {
      query: { base: from, symbols: Conversion.to_currencies.keys.join(',') },
      headers: client.auth_headers
    }
    response = client.get('/exchangerates_data/latest', options)

    rates = response['rates'].map { |k, v| [k.downcase, v] }.to_h
    rates[to]
  end
end

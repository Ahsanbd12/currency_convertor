module StubberHelper
  def json_dir
    File.join File.dirname(__FILE__), '../fixtures/json'
  end

  # Return a filename for a JSON fixture
  def json_file(filename)
    File.join json_dir, filename
  end

  def json_string(filename)
    File.read json_file(filename)
  end

  def stub_apilayer_request
    status = 200
   response_body = json_string("rates.json")
    stub_request(:get, 'https://api.apilayer.com/exchangerates_data/latest')
      .with(
        query: { symbols: Conversion.to_currencies.keys.join(','), base: 'usd' },
        headers: {
          'apikey' => 'test',
          'Accept'=>'*/*'
        }
      )
      .to_return(status: status, body: response_body, headers: { content_type: 'application/json'})
  end

end

RSpec.configure do |config|
  config.include StubberHelper
end
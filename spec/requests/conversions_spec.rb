require 'rails_helper'

RSpec.describe 'Conversions', type: :request do
  describe '#index' do
    let(:conversion) { create(:conversion) }
    it "return succes" do
      get "/conversions"
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    it 'return success' do
      stub_apilayer_request
      post "/conversions", params:  { conversion: {from_currency: "usd", to_currency: "jpy", amount: 100}}
      expect(response).to have_http_status(:found)
    end
  end

  describe '#show' do
    let(:conversion) { create(:conversion) }
    it 'return success' do
      get "/conversions/#{conversion.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end

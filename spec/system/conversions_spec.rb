require 'rails_helper'
require 'webdrivers'

# WebDrivers Gem
# https://github.com/titusfortner/webdrivers
#
# Official Guides about System Testing
# https://api.rubyonrails.org/v5.2/classes/ActionDispatch/SystemTestCase.html

RSpec.describe 'Convesions', type: :system do
  before do
    driven_by :selenium, using: :chrome
  end

  describe 'index' do
    it 'shows a list of history conversaions' do
      visit root_path
      expect(page).to have_text('Conversions History')

      # Fill Form
      click_on 'Create Conversion'
      expect(page).to have_text('Conversion')
      stub_apilayer_request
      fill_in('Amount', :with => 200)
      select('usd', :from => 'From currency')
      select('jpy', :from => 'To currency')
      click_on 'Convert'
      expect(page).to have_text('Conversions History')
      expect(page).to have_text('Amount: 200.0')
      expect(page).to have_text('exchange_rate: 107.346001')

      ## Visit History Page
      visit root_path
      expect(page).to have_text('Conversions History')
      expect(page).to have_text('200.0')
      expect(page).to have_text('107.346001')
    end
  end
end
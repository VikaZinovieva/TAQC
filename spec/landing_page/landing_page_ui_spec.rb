require_relative '../spec_helper'

landing_page = LandingPage.new

RSpec.describe 'Landing page' do
    before(:all) { browser.get(HOME_PAGE) }
    
    after(:all) { browser.close }

    it 'verifies "Sign In" button is displayed' do
        expect(landing_page.sign_in_button.displayed?).to eq(true)
    end
end


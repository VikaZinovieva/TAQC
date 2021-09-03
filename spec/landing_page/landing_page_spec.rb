require_relative '../spec_helper'

RSpec.describe 'Landing page' do

    landing_page = LandingPage.new
    sign_in_page = SignInPage.new

    before(:all) do
        browser.get(HOME_PAGE)
    end

    after(:all) { browser.close }

    it 'verify that User can redirect to "Sign In" page' do
        landing_page.sign_in_button.click
        expect(sign_in_page.page_title).to eq('AUTHENTICATION')
    end

end

require_relative '../spec_helper'

RSpec.describe 'My account page' do
    sign_in_page = SignInPage.new
    my_account_page = MyAccountPage.new
    landing_page = LandingPage.new

    before(:all) do 
        browser.get(HOME_PAGE)
        landing_page.sign_in_button.click
        sign_in_page.login_user(USER_LOGIN, USER_PASSWORD)
    end

    after(:all) { browser.close }

    it 'verifies "Sign Out" bottun is displayed' do
        expect(my_account_page..displayed?).to sign_out_buttoneq(true)
    end
end

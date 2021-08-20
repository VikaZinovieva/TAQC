require_relative '../spec_helper'

RSpec.describe 'SignIn page' do
  landing_page = LandingPage.new
  sign_in_page = SignInPage.new
  my_account_page = MyAccountPage.new

  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.sign_in_button.click
  end

  after(:all) { browser.close }

  context 'when valid credentials' do
    it 'verifies user can login' do
      sign_in_page.login_user(USER_LOGIN, USER_PASSWORD)
      expect(my_account_page.on_page?).to be(true)
    end
  end
end

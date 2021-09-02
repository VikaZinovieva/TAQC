require 'spec_helper'

MY_ACCOUNT_PAGE = 'http://automationpractice.com/index.php?controller=my-account'
my_account_page = MyAccountPage.new

RSpec.shared_examples 'when button is clicked' do |button, link, page|
  it "verify that User can redirect to #{button} page" do
    my_account_page.click_on(button, link, page)
    expect(page.url_include?(link)).to be(true)
  end
end

RSpec.describe 'My account page' do
  sign_in_page = SignInPage.new
  landing_page = LandingPage.new

  links_on_my_account = {
    'Orders' : ['history', HistoryPage.new],
    'Credit slips' : ['order-slip', CreditSlipsPage.new],
    'Addresses' : ['addresses', MyAddressesPage.new],
    'Information' : ['identity', YourPersonalInfoPage.new],
    'My wishlists' : ['mywishlist', MyWishlistsPage.new]
  }

  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.sign_in_button.click
    sign_in_page.login_user(USER_LOGIN, USER_PASSWORD)
  end

  after(:all) { browser.close }
  
  before(:each) { browser.get(MY_ACCOUNT_PAGE) }

  links_on_my_account.each_pair do |key, value| 
    it_behaves_like 'when button is clicked', key, value[0], value[1] 
  end

end


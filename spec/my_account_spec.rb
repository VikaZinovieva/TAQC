require 'spec_helper'

RSpec.shared_examples 'when button is clicked' do |button, link, page|
  it "verify that User can redirect to #{button} page" do
    my_account_page.click_on(button, link, page)
    expect(page.url_include?(link)).to be(true)
  end
end

RSpec.describe 'My account page - buttons' do
  links_on_my_account = {
      'Orders' => ['history', HistoryPage.new],
      'Credit slips' => ['order-slip', CreditSlipsPage.new],
      'Addresses' => ['addresses', MyAddressesPage.new],
      'Information' => ['identity', YourPersonalInfoPage.new],
      'My wishlists' => ['mywishlist', MyWishlistsPage.new]
  }

  before(:all) do
    get_home_page
    landing_page.sign_in_button.click
    sign_in_page.login_user(USER_LOGIN, USER_PASSWORD)
  end

  after(:all) { browser.close }

  before(:each) { browser.get(MyAccountPage::MY_ACCOUNT_PAGE_URL) }

  context 'when any button' do
    links_on_my_account.each_pair do |key, value|
      it_behaves_like 'when button is clicked', key, value[0], value[1]
    end
  end

  context 'when sign out' do
    it 'verify that User can redirect to Landing page' do
      my_account_page.home_icon.click
      expect(landing_page.url_include?(HOME_PAGE)).to be(true)
    end


    it 'verify that User can redirect to "Sign Out" page' do
      my_account_page.sign_out_button.click
      expect(sign_in_page.page_title).to eq('AUTHENTICATION')
    end
  end
end

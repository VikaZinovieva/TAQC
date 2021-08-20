require_relative '../spec_helper'

RSpec.describe 'SignIn page' do
  landing_page = LandingPage.new
  sign_in_page = SignInPage.new

  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.sign_in_button.click
  end

  after(:all) { browser.close }

  it 'verifies email field displayed' do
    expect(sign_in_page.email_input.displayed?).to eq(true)
  end

  it 'verifies title displayed' do
    expect(sign_in_page.page_title.text).to include(SignInPage::PAGE_TITLE)
  end

  it 'verifies password field displayed' do
    expect(sign_in_page.password_input.displayed?).to eq(true)
  end

  it 'verifies sign in button displayed' do
    expect(sign_in_page.sign_in_button.displayed?).to eq(true)
  end
end

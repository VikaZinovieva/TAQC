
require_relative '../spec_helper'
#rspec spec/contactus/contact_us_spec.rb  --color --format doc
RSpec.describe 'Contact us page' do
  landing_page = LandingPage.new
  sign_in_page  = SignInPage.new
  my_account_page = MyAccountPage.new


  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.sign_in_button.click
  end

  it 'Verify that user with valid credentials can login' do
    sign_in_page.login_user('adia1991@bk.ru', '1234QWER')
    expect(my_account_page.on_page?).to eq(true)
  end

  it 'Verify that after clicking Sign out button user redirected on Authentication page' do
    my_account_page.log_out_button.click
    expect(sign_in_page.page_title.displayed?). to be(true)
    end


  it "Verify upon leaving Email address’ and ‘Password’ fields are empty
and clicking on ‘Sign in’ button ‘An email address required.’ message is shown" do
    sign_in_page.login_user(" ", " ")
    expect(sign_in_page.error_message.displayed?).to be(true)
  end

  it "Verify upon filling ‘Email address’ and ‘Password’ fields with invalid data
and clicking on ‘Sign in’ button ‘Invalid email address.’ message is shown." do
    sign_in_page.login_user("@gmail.com ", "1234 ")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon filling ‘Email address’ field with valid data and filling ‘Password’ field with invalid data
and clicking on ‘Sign in’ button ‘Authentication failed.’ message is shown." do
    sign_in_page.login_user("adia1991@bk.ru", "12345678910$%^&*&1112131415qwertyu")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon filling ‘Email address’ field with valid data and filling ‘Password’ field with invalid data
and clicking on ‘Sign in’ button ‘Authentication failed.’ message is shown." do
    sign_in_page.login_user("adia1991@bk.ru", "123")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon leaving ‘Email address’ field empty and filling ‘Password’ field with valid data
and clicking on ‘Sign in’ button ‘Authentication failed.’ message is shown." do
    sign_in_page.login_user("  ", "1234QWER")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon filling ‘Email address’ field with valid data and leaving ‘Password’ field is empty
and clicking on ‘Sign in’ button ‘Password is required.’ message is shown." do
    sign_in_page.login_user("adia1991@bk.ru", " ")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon filling ‘Email address’ field with valid data and filling ‘Password’ field with invalid data
and clicking on ‘Sign in’ button ‘Authentication failed.’ message is shown." do
    sign_in_page.login_user("adia1991@bk.ru", "123")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it  "Verify upon leaving ‘Email address’ field is empty and filling ‘Password’ field with invalid data
  and clicking on ‘Sign in’ button ‘An email address required.’ message is shown." do
    sign_in_page.login_user("adia1991@bk.ru", "123")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon filling ‘Email address’ field with valid non-existing data and ‘Password’ field with valid data
and clicking on ‘Sign in’ button ‘Authentication failed.’ message is shown." do
    sign_in_page.login_user("vika-pika666@gmail.com", "1234QWER")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon filling ‘Email address’ field with valid existing data and filling ‘Password’ field with valid non-existing data
 and clicking on ‘Sign in’ button ‘Authentication failed.’ message is shown." do
    sign_in_page.login_user("adia1991@bk.ru", "1234QWERTY")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  it "Verify upon filling ‘Email address’ field with valid existing password and filling ‘Password’ field with valid existing email
and clicking on ‘Sign in’ button ‘Invalid Email address.’ message is shown." do
    sign_in_page.login_user("1234QWE", "adia1991@bk.ru")
    expect(sign_in_page.error_message.displayed?).to be(true)
    sign_in_page.clear_fields
  end

  after(:all) { browser.close }
  end





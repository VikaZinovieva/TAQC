require_relative '../spec_helper'
#rspec spec/contactus/contact_us_spec.rb  --color --format doc
RSpec.describe 'Contact us page' do
  landing_page = LandingPage.new
  contact_us_page = ContactUs.new

  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) { browser.close }

  it 'Verify that user can send a message with valid creditals' do
    landing_page.contact_us_button.click
    contact_us_page.select_subject.click
    contact_us_page.input_data_email('sobaka@mail.ru')
    contact_us_page.input_message_field('rygufggutgfreuib')
    contact_us_page.input_order('56784766')
    contact_us_page.send_button.click
    expect(contact_us_page.message_successfully_sent.displayed?).to be(true)
  end

  it 'Verify that user cant send a message without valid creditals' do
    landing_page.contact_us_button.click
    contact_us_page.send_button.click
    expect(contact_us_page.error1.displayed?).to be(true)
  end


  it 'Verify that user cant send a message with invalid creditals' do
    landing_page.contact_us_button.click
    contact_us_page.input_data_email('sobaka@mail.ru')
    contact_us_page.input_message_field('rygufggutgfreuib')
    contact_us_page.input_order('56784766')
    contact_us_page.send_button.click
    expect(contact_us_page.error1.displayed?).to be(true)
  end

  it "Verify 'Home' page is opened after clicking 'Return to Home' link" do
    landing_page.contact_us_button.click
    contact_us_page.home_link.click
    expect(landing_page.landing_page.displayed?).to be(true)
  end

  it "Verify that user cant send a message without filled 'Message' field" do
    landing_page.contact_us_button.click
    contact_us_page.select_subject.click
    contact_us_page.input_data_email('sobaka@mail.ru')
    contact_us_page.input_order('56784766')
    contact_us_page.send_button.click
    expect(contact_us_page.error1.displayed?).to be(true)
  end

  it "Verify that user can choose second item from 'Subject Heading' dropdown menu on 'CUSTOMER SERVICE - CONTACT US' page" do
    landing_page.contact_us_button.click
    #contact_us_page.select_dropdown_customer
    contact_us_page.select_subject.click
    expect(contact_us_page.message_under_dropdown2.displayed?).to eq(true)
  end

=begin
  it 'Verify that user can return to start page by clicking Home button' do
    landing_page.contact_us_button.click
    contact_us_page.select_subject.click
    contact_us_page.input_data_email('sobaka@mail.ru')
    contact_us_page.input_message_field('rygufggutgfreuib')
    contact_us_page.input_order('56784766')
    contact_us_page.send_button.click
    contact_us_page.home_button.click
    expect(landing_page.landing_page.displayed?).to be(true)
  end

  it 'Verify that user can choose items from Subject Heading dropdown menu on CUSTOMER SERVICE - CONTACT US page' do
    landing_page.contact_us_button.click
    contact_us_page.select_dropdown_customer
    expect(contact_us_page.message_under_dropdown1.displayed?).to eq(true)
  end


=end
  end
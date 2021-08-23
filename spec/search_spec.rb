require 'spec_helper'
# no need
require_relative '../search_page.rb'


RSpec.describe 'Search tab' do
  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) {browser.close}

  context 'when valid and invalid credentials' do
    it 'verifies user can use search by existed data' do
      data = 't-shirt'
      search_page.enter_data(data)
      search_page.clk
      expect(search_page.find?(data) to be(true))
    end

    it 'verifies user can not find any item by typing unsexisted data' do
      data = 'asdsadsada'
      search_page.enter_data(data)
      search_page.clk
      expect(search_page.find?(data)).to be(false)
    end

    # ?
    it 'verifies that unexisted search data will be described in the alert message' do
      data = 'a' * 50
      search_page.enter_data(data)
      search_page.clk
      expect(search_page.alert?.to include(data))
    end

    it 'after clicking on the search button with empty field the alert message shows' do
      search_page.clk
      expect(search_page.alert?.displayed? to be(true))
    end

  end

  context 'UI search field check' do
    it 'verify that search field is displayed' do
      expect(search_page.search_input.displayed? to be(true))
    end
  end

  it 'verify that search button is displayed' do
    expect(search_page.search_btn.displayed? to be(true))
  end
end
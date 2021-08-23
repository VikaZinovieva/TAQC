require 'spec_helper'

RSpec.describe 'Search tab' do
  search_page = SearchPage.new

  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) { browser.close }

  context 'when valid and invalid credentials' do
    it 'verifies user can use search by existed data' do
      data = 't-shirt'
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.url_include?(data)).to be(true)
    end

    it 'verifies user can not find any item by typing unexisted data' do
      data = 'asdsadsada'
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.url_include?(data)).to be(true)
    end

    it 'verifies that unexisted search data will be described in the alert message' do
      data = 'a' * 50
      current_url = browser.current_url
      search_page.search(data)
      search_page.wait_for{ current_url != browser.current_url }
      expect(search_page.alert.text).to include(data)
    end

    it 'after clicking on the search button with empty field the alert message shows' do
      search_page.search_input.clear
      search_page.search_btn.click
      expect(search_page.alert.displayed?).to be(true)
    end
  end

  context 'UI search field check' do
    it 'verify that search field is displayed' do
      expect(search_page.search_input.displayed?).to be(true)
    end
  end

  it 'verify that search button is displayed' do
    expect(search_page.search_btn.displayed?).to be(true)
  end
end
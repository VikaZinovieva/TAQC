require 'spec_helper'

RSpec.describe 'Search tab' do
  search_page = SearchPage.new

  before(:all) do
    browser.get(HOME_PAGE)
	search_page.search_input.clear
  end
  

  after(:all) { browser.close }
  
  context 'UI search field check' do
    it 'verify that search field is displayed' do
      expect(search_page.search_input.displayed?).to be(true)
	end
  

	it 'verify that search button is displayed' do
		expect(search_page.search_btn.displayed?).to be(true)
	end
	
	
  end
  
  context 'when valid credentials' do
    it 'verifies user can use search by existed data' do
	  search_page.search_input.clear
      data = 't-shirt'
      search_page.enter_data(data)
	  search_page.search_btn.click
      expect(search_page.url_include?(data)).to be(true)
	end
  end
  
	context 'when invalid credentials' do
		it 'verifies user request will be described in the url field' do
		data = 'asdsadsada'
		search_page.enter_data(data)
		search_page.search_btn.click
		expect(search_page.url_include?(data)).to be(true)
	end
	
    
	
	it 'verifies that user request which consist unexisted data can not find anything' do
      expect(search_page.results_label.text) == '0 results have been found.'
	end
    

    it 'verifies that unexisted search data will be described in the alert message' do
      data = 'a' * 50
      search_page.enter_data(data)
	  search_page.search_btn.click
      expect(search_page.alert.text).to include(data)
	end
	
	it 'verifies that user can not find any item by using special symbols' do
      data = '@%#' * 50
      search_page.enter_data(data)
	  search_page.search_btn.click
      expect(search_page.alert.text).to include(data)
	end
	
	it 'verifies that user can not find any item by using numbers' do
      data = '255151'
      search_page.enter_data(data)
	  search_page.search_btn.click
      expect(search_page.alert.text).to include(data)
	end
	
	it 'verifies that user can not find any item by using mixed data' do
      data = '255151A%fDS64&&'
      search_page.enter_data(data)
	  search_page.search_btn.click
      expect(search_page.alert.text).to include(data)
	end
  end
	
  context 'UI results checking' do
    it 'after clicking on the search button with empty field the alert message shows' do
      expect(search_page.alert.displayed?).to be(true)
	end
	
	it 'verify that after pushing on the search icon the search label is displayed' do
		expect(search_page.search_label.displayed?).to be(true)
	end
		
	it 'verify that after pushing on the search icon the search label is displayed' do
		expect(search_page.search_label.displayed?).to be(true)
	end
		
	it 'verify that after pushing on the search icon the text the navigation tab is displayed' do
		expect(search_page.search_label.text) == 'Search'
	end
  end

context 'Security checking'
	it 'verifies that after entering SQL request in the search field alert message will be described' do
		data = 'SELECT * FROM Data WHERE name = "t-shirt"'
		search_page.enter_data(data)
		search_page.search_btn.click
		expect(search_page.alert.displayed?).to be(true)
	end
	
	it 'verifies that after entering XSS value in the search field alert message will be described' do
		data = '<script>text</script>'
		search_page.enter_data(data)
		search_page.search_btn.click
		expect(search_page.alert.displayed?).to be(true)
	end
  end	
end

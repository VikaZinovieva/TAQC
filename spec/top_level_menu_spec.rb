require 'spec_helper'

RSpec.describe 'TopLevelMenu tab' do
  tplevelmenu_tab = TPLMTab.new

  before(:all) do
    browser.get(HOME_PAGE)
  end

  after(:all) { browser.close }

  context 'TPLM UI Check' do
	it 'verify that all tab with buttons is displayed' do
      expect(tplevelmenu_tab.tplm_bar.displayed?).to be(true)
    end
	
    it 'verify that women button is displayed' do
      expect(tplevelmenu_tab.women.displayed?).to be(true)
    end

    it 'verify that dresses button is displayed' do
      expect(tplevelmenu_tab.dresses.displayed?).to be(true)
    end

    it 'verify that tshirts button is displayed' do
      expect(tplevelmenu_tab.tshirts.displayed?).to be(true)
    end
 
	it 'verify that after clicking on the any button on the TPLM bar home icon is displayed' do
		current_url = browser.current_url
		tplevelmenu_tab.tshirts.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.home_icon.displayed?).to be(true)
	end
	
	it 'verify that after clicking on the dresses button on the TPLM bar dresses label is displayed' do
		current_url = browser.current_url
		tplevelmenu_tab.dresses.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.dresses_label.displayed?).to be(true)
	end
	
	it 'verify that after clicking on the women button on the TPLM bar women label is displayed' do
		current_url = browser.current_url
		tplevelmenu_tab.women.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.women_label.displayed?).to be(true)
	end
	
	it 'verify that after clicking on the t-shirts button on the TPLM bar t-shirts label is displayed' do
		current_url = browser.current_url
		tplevelmenu_tab.tshirts.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.tshirts_label.displayed?).to be(true)
	end
    
    it 'verify that all tab with buttons is displayed' do
      expect(tplevelmenu_tab.tplm_bar.displayed?).to be(true)
    end
  end

  context 'with valid credentials' do
	it 'verify that after clickng on the women button women page is opened' do
		current_url = browser.current_url
		tplevelmenu_tab.women.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.url_include?('id_category=3')).on page?(true)
	end
	
	it 'verify that after clicking on the dresses button dresses page is opened' do
		current_url = browser.current_url
		tplevelmenu_tab.dresses.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.url_include?('id_category=8')).on page?(true)
	end
	
	it 'verify that after clicking on the t-shirts button t-shirts page is opened' do
		current_url = browser.current_url
		tplevelmenu_tab.tshirts.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		expect(tplevelmenu_tab.url_include?('id_category=5')).on page?(true)
	end
   
	
	it 'verify that after clicking on the home icon current widget will be removed' do
		current_url = browser.current_url
		tplevelmenu_tab.women.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		tplevelmenu_tab.home_icon.click
		expect(tplevelmenu_tab.home_icon.displayed?).to be(false)
	end
	
	it 'verify that after clicking on the home icon user will be redirected to the main page' do
		current_url = browser.current_url
		tplevelmenu_tab.women.click
		tplevelmenu_tab.wait_for{ current_url != browser.current_url }
		tplevelmenu_tab.home_icon.click
		expect(tplevelmenu_tab.url_include?('http://automationpractice.com/index.php')) == HOME_PAGE
   end
	
end

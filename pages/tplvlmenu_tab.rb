class TPLMTab < BasePage
  PAGE_TITLE = 'TOPLEVEL MENU TAB'
  
  def women
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]/li/a[@title="Women"]')
  end

  def dresses
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]/li/a[@title="Dresses"]')
  end

  def tshirts
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]/li/a[@title="T-shirts"]')
  end

  def tplm_bar
    browser.find_element(xpath: '//ul[@class="sf-menu clearfix menu-content sf-js-enabled sf-arrows"]')
  end
  
  def home_icon
	browser.find_element(class: 'home')
  end
  
  def dresses_label
	browser.find_element(xpath: '//div[@class="breadcrumb clearfix"]/span["Women"]')
  end
  
  def women_label
	browser.find_element(xpath: '//div[@class="breadcrumb clearfix"]/span["Dresses"]')
  end
  
  def tshirts_label
	browser.find_element(xpath: '//div[@class="breadcrumb clearfix"]/span["T-shirts"]')
  end
end

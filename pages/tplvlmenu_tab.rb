class TPLMTab < BasePage
  def women
    browser.find_element(name: 'Women')
  end

  def dresses
    browser.find_element(name: 'Dresses')
  end

  def tshirts
    browser.find_element(name: 'T-shirts')
  end

  def tplm_bar
    browser.find_element(class: 'sf-menu clearfix menu-content sf-js-enabled sf-arrows')
  end
end
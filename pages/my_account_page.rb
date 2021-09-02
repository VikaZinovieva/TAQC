class MyAccountPage < BasePage
 
  def button(name)
    browser.find_element(xpath: "//a[@title= \"#{name}\"]")
  end

  def click_on(name, link, page)
    button(name).click
    wait_for{ page.url_include?(link) }
  end

end


class MyAccountPage < BasePage

  MY_ACCOUNT_PAGE_URL = 'http://automationpractice.com/index.php?controller=my-account'

  def button(name)
    browser.find_element(xpath: "//a[@title= \"#{name}\"]")
  end
  
  def log_out_button
    browser.find_element(class: 'logout')
  end

  def click_on(name, link, page)
    button(name).click
    wait_for{ page.url_include?(link) }
  end

  def sign_out_button
    browser.find_element(class: 'logout')
  end

  def home_icon
    browser.find_element(class: 'icon-home')
  end

end


class LandingPage < BasePage
  def sign_in_button
    browser.find_element(class: 'login')
  end
  
  def women_button
    browser.find_element(xpath: "//a[@title='Women']")
  end
end


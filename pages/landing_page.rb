class LandingPage < BasePage
  def sign_in_button
    browser.find_element(class: 'login')
  end
end

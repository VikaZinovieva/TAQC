class SignInPage
  PAGE_TITLE = 'AUTHENTICATION'

  def page_title
    #TBD to move to parent page
    browser.find_element(class: 'page-heading')
  end

  def email_input
    browser.find_element(id: 'email')
  end

  def password_input
    browser.find_element(id: 'passwd')
  end

  def sign_in_button
    browser.find_element(id: 'SubmitLogin')
  end

  def login_user(email, password)
    email_input.send_keys(email)
    password_input.send_keys(password)
    sign_in_button.click
  end
end
class RegPage < BasePage
  PAGE_TITLE = 'REGISTRATION'

  def reg_email
    browser.find_element(class: 'login')
  end

  def email_find
    browser.find_element(id: 'email_create')
  end

  def home_bttn
    browser.find_element(class: 'home')
  end

  def log_form
    browser.find_element(id: 'login_form')
  end

  def submt_button
    browser.find_element(id: 'SubmitCreate')
  end

  def reg(value)
    reg_email.click
    email_input(value)
    submt_button.click
  end

  def email_input(value)
    email_find.send_keys(value)
    @submt_button
  end

  def existed_email
    browser.find_element(id: 'create_account_error')
  end

  def marked_field
    browser.find_element(id: 'uniform-id_gender1')
  end

  def reg_input(reg_data)
    browser.find_element(id: 'uniform-id_gender1').click
    browser.find_element(id: 'customer_firstname').send_keys(reg_data['first'])
    browser.find_element(id: 'customer_lastname').send_keys(reg_data ['last'])
    browser.find_element(id: 'passwd').send_keys(reg_data ['password'])
    browser.find_element(xpath:'//select[@id="days"]/option[@value = "1"]').click
    browser.find_element(xpath:'//select[@id="months"]/option[@value = "11"]').click
    browser.find_element(xpath:'//select[@id="years"]/option[@value = "1984"]').click
    browser.find_element(id: 'address1').send_keys(reg_data['adress'])
    browser.find_element(id: 'city').send_keys(reg_data['city'])
    browser.find_element(xpath:'//select[@id="id_state"]/option[@value = "23"]').click
    browser.find_element(id: 'postcode').send_keys(reg_data['zip'])
    browser.find_element(xpath:'//select[@id="id_state"]/option[@value = "5"]').click
    browser.find_element(id: 'phone_mobile').send_keys(reg_data['mobile'])
    browser.find_element(id: 'alias').send_keys(reg_data['alis'])
  end

  def fname
    browser.find_element(id: 'customer_firstname')
  end

  def lname
    browser.find_element(id: 'customer_lastname')
  end

  def alert_mes
    browser.find_element(class: 'alert-danger')
  end

  def login_user(email, password)
    email_input.send_keys(email)
    password_input.send_keys(password)
    sign_in_button.click
  end

  def done_button
    browser.find_element(id: 'submitAccount')
  end

  def sign_out
    browser.find_element(class: 'logout')
  end

  def ref
    browser.get("http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation");
    browser.navigate.refresh
  end



  def on_page?
    page_title.include?(PAGE_TITLE)
  end
  end
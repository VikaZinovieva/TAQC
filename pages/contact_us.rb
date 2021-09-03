class ContactUs < BasePage

  def on_page?
    browser.current_url.include? 'contact'
  end

  def onpage
    browser.find_element(class: 'navigation_page').include? 'Contact'
  end

  def message_field
    browser.find_element(id: 'message')
  end

  def email_field
    browser.find_element(id: 'email')
  end

  def id_order_field
    browser.find_element(id: 'id_order')
  end

  def file_upload_field
    browser.find_element(id: 'uniform-fileUpload')
  end

  def file_button
    browser.find_element(class: 'action')
  end

  def selector_field
    browser.find_element(class: 'selector')
  end

  def send_button
    browser.find_element(id: 'submitMessage')
  end

  def input_data_email(email)
    email_field.send_keys(email)
  end

  def input_message_field(message)
    message_field.send_keys(message)
  end

  def select_subject
    browser.find_element(xpath: '//*[@id="id_contact"]/option[3]')
  end

  def select_subject_default
    browser.find_field('id_contact').find('option[selected]').text
  end

  def error1
    browser.find_element(xpath: '//div[@id = "center_column"]/div[@class = "alert alert-danger"]')
  end

  def  message_successfully_sent
    browser.find_element(class: 'alert-success')
  end

  def input_order(order)
    id_order_field.send_keys(order)
  end

  def home_link
    browser.find_element(class: 'icon-home')
  end

  def home_button
    browser.find_element(class: 'btn btn-default button button-small')
  end

  def contact_link
    browser.find_element(id: 'contact-link')
  end

  def select_dropdown_webmaster
    browser.find_element(class: 'desc_contact1')
  end

  def select_dropdown_customer
    browser.find_element(id: 'desc_contact2')
  end

  def message_under_dropdown2
    browser.find_element(xpath: '//*[@id="desc_contact1"]/i')
  end

  def message_under_dropdown1
    browser.find_element(xpath: '//*[@id="desc_contact2"]/i')
  end

end
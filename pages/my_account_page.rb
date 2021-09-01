class MyAccountPage
  def on_page?
    browser.current_url.include? 'my-account'
  end
  def log_out_button
    browser.find_element(class: 'logout')
  end
end

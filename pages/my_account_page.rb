class MyAccountPage
  def on_page?
    browser.current_url.include? 'my-account'
  end
end

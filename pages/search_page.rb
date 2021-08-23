class SearchPage
  def search_input
    browser.find_element(id: 'search_query_top')
  end

  def search_btn
    browser.find_element(class: 'btn btn-default button-search')
  end

  def enter_data(data)
    search_input.send_keys(data)
  end

  # no need in such method here
  def clk
    search_btn.click
  end

  def find?(data)
    browser.current_url.include? data
  end

  def is_alert?
    browser.find_element(class: 'alert alert-warning')
  end
end
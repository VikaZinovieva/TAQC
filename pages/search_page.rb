class SearchPage < BasePage
  PAGE_TITLE = 'SEARCH'

  def search_input
    browser.find_element(id: 'search_query_top')
  end

  def search_btn
    browser.find_element(class: 'button-search')
  end

  def enter_data(data)
    search_input.send_keys(data)
  end

  def alert
    browser.find_element(class: 'alert-warning')
  end

  def search(value)
    search_input.clear
    enter_data(value)
    search_btn.click
  end

  def on_page?
    page_title.include?(PAGE_TITLE)
  end
end

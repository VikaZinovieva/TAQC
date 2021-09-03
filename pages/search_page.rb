class SearchPage < BasePage
  PAGE_TITLE = 'SEARCH'

  def search_input
    browser.find_element(id: 'search_query_top')
  end

  def search_btn
    browser.find_element(class: 'button-search')
  end

  def enter_data(data)
	search_input.clear
    search_input.send_keys(data)
  end

  def alert
    browser.find_element(class: 'alert-warning')
  end
  
  def search_label
	browser.find_element(class: 'product-listing')
  end

  def on_page?
    page_title.include?(PAGE_TITLE)
  end
  
  def results_label
	browser.find_element(class: 'heading-counter')
  end
  
  def search_nav_page
	browser.find_element(class: 'navigation_page')
  end
  
end

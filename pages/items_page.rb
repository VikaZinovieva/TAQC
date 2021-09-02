class ItemsPage < BasePage
  def quantity
    browser.find_element(id: 'quantity_wanted')
  end
end
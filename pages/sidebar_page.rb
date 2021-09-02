class SideBar < BasePage
  def sidebar
    browser.find_element(class: 'sfHoverForce')
  end
end


class ItemsPage < BasePage
  PAGE_TITLE = 'ITEMS'

  def quantity
    browser.find_element(xpath:'//p[@id="quantity_wanted"]/input[@name ="qty"]')
  end
  
  def quantity_enter(data)
	quantity.clear
	quantity.send_keys(data)
  end
  
  def asc_btn
	browser.find_element(xpath:'//a[@class="btn btn-default button-plus product_quantity_up"]')
  end
  
  def desc_btn
	browser.find_element(xpath:'//a[@class="btn btn-default button-minus product_quantity_down"]')
  end
  
  def photo
	browser.find_element(id: 'bigpic')
  end
  
  def size
	browser.find_element(id: 'group_1')
  end
  
  def size_sub
	browser.find_element(xpath: '//select[@class="form-control attribute_select no-print"]/options[@title = "M"]')
  end
  
  def cart_btn
	browser.find_element(class: 'exclusive')
  end
  
  def fullscr_photo
	browser.find_element(class: 'fancybox-outer')
  end
  
  def fullscr_nxt
	browser.find_element(class: 'fancybox-nav fancybox-next')
  end
  
  def fullscr_prev
	browser.find_element(class: 'fancybox-nav fancybox-prev')
  end
  
  def fullscr_cls
	browser.find_element(class: 'fancybox-item fancybox-close')
  end
  
  def tweet
	browser.find_element(class: 'btn btn-default btn-twitter')
  end
  
  def penter
	browser.find_element(class: 'fancybox-nav fancybox-prev')
  end
  
  def facebook
	browser.find_element(class: 'btn btn-default btn-facebook')
  end
  
  def google
	browser.find_element(class: 'btn btn-default btn-google-plus')
  end
  
  def sub_photos
	browser.find_element(class: 'thumbs_list_frame')
  end
  
  def view_scroll
	browser.find_element(id: 'view_scroll_right')
  end 
  
  def subphoto
	browser.find_element(id: 'thumb_2')
  end
  
  def view_scroll_lft
	browser.find_element(id: 'view_scroll_left')
  end
  
end

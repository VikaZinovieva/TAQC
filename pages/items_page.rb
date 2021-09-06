class ItemsPage < BasePage
  PAGE_TITLE = 'ITEMS'

  # Buttons & fields
	
  def quantity
    browser.find_element(id:'quantity_wanted')
  end
  
  def quantity_enter(data)
	quantity.clear
	quantity.send_keys(data)
  end
  
  def fullscr_exs?
	!browser.find_elements(xpath: '//body/div[@class = "fancybox-wrap fancybox-desktop fancybox-type-image fancybox-opened"]').empty?
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
  
  def wishlist
	browser.find_element(id: 'wishlist_button')
  end
  
  def size
	browser.find_element(xpath: '//select[@id = "group_1"]')
  end
  
  def size_sub
	browser.find_element(xpath: '//select[@id = "group_1"]/option[@value = "2"]')
  end
  
  def apply_btn
	browser.find_element(class: 'button-medium')
  end
  
  def cont_btn
	browser.find_element(class: 'exclusive-medium')
  end
  
  def cart_btn
	browser.find_element(id: 'add_to_cart')
  end
  
  def fullscr_nxt
	browser.find_element(class: 'fancybox-next')
  end
  
  def fullscr_prev
	browser.find_element(class: 'fancybox-prev')
  end
  
  def fullscr_cls
	browser.find_element(class: 'fancybox-close')
  end
 
  def abort_btn
	browser.find_element(class: 'cross')
  end
  
  def view_scroll
	browser.find_element(id: 'view_scroll_right')
  end 
  
  def tweet
	browser.find_element(class: 'btn-twitter')
  end
  
  def penter
	browser.find_element(class: 'btn-pinterest')
  end
  
  def facebook
	browser.find_element(class: 'btn-facebook')
  end
  
  def google
	browser.find_element(class: 'btn-google-plus')
  end
  
  def view_scroll_lft
	browser.find_element(id: 'view_scroll_left')
  end
  
  def friend_btn
	browser.find_element(id: 'send_friend_button')
  end
  
  def print_btn
	browser.find_element(class: 'print')
  end
  
  def friend_name
	browser.find_element(id: 'friend_name')
  end
  
  def friend_email
	browser.find_element(id: 'friend_email')
  end
  
  def send_btn
	browser.find_element(id: 'sendEmail')
  end
  
  def add_form(name, email)
	friend_name.send_keys(name)
	friend_email.send_keys(email)
  end
  
  def ok_btn
	browser.find_element(xpath: '//p[@class = "submit"]/input[@value = "OK"]')
  end
  
  
  
  # Message boxes, Labels, active widgets 
  
  def btn_container
	browser.find_element(class: 'button-container')
  end
  
  def friend_form
	browser.find_element(id: 'send_friend_form')
  end
  
  def message
	browser.find_element(class: 'fancybox-inner')
  end
  
  def layer_cart
	browser.find_element(class: 'clearfix')
  end
  
  def item_alert
	browser.find_element(class: 'fancybox-outer')
  end
 
  def amount
	browser.find_element(class: 'unvisible')
  end
  
  def fullscr
	browser.find_element(class: 'fancybox-image')
  end
  
  def sub_photos
	browser.find_element(id: 'thumbs_list')
  end
  
  def subphoto
	browser.find_element(id: 'thumb_2')
  end
end

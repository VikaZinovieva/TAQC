require 'spec_helper'


RSpec.describe 'Items page' do
  items_page = ItemsPage.new

  before(:all) do
    browser.get(PRODUCT)
  end

  after(:all) { browser.close } 
  
  context 'UI checking' do
	# UI Testing on the Items page
	it 'verifies that quantities field is displayed' do
		expect(items_page.quantity.displayed?).to be(true)
	end
	
	it 'verifies that increment button is displayed' do
		expect(items_page.asc_btn.displayed?).to be(true)
			
	end
	
	it 'verifies that decrement button is displayed' do
		expect(items_page.desc_btn.displayed?).to be(true)
			
	end
	
	it 'verifies that wishlist button is displayed' do
		expect(items_page.wishlist.displayed?).to be(true)
	end
	
	it 'verifies that photo is displayed' do
		expect(items_page.photo.displayed?).to be(true)
	end
	
	it 'verifies that size subfield is displayed' do
		items_page.size.click
		expect(items_page.size_sub.displayed?).to be(true)
	end
	
	it 'verifies that add to cart button is displayed' do
		expect(items_page.cart_btn.displayed?).to be(true)
	end
	
	it 'verifies that tweeter button is displayed' do
		expect(items_page.tweet.displayed?).to be(true)
	end
	
	it 'verifies that facebook button is displayed' do
		expect(items_page.facebook.displayed?).to be(true)
	end
	
	it 'verifies that google+ button is displayed' do
		expect(items_page.google.displayed?).to be(true)
	end
	
	it 'verifies that pintertest button is displayed' do
		expect(items_page.penter.displayed?).to be(true)
	end
	
	it 'verifies that subphotos are displayed' do
		expect(items_page.sub_photos.displayed?).to be(true)
	end
	
	it 'verifies that scroll button is displayed' do
		expect(items_page.view_scroll.displayed?).to be(true)
	end
	
	it 'verifies that print button is displayed' do
		expect(items_page.print_btn.displayed?).to be(true)
	end
	
	it 'verifies that send to friend button is displayed' do
		expect(items_page.friend_btn.displayed?).to be(true)
	end
	
	it 'verifies that fullscreen is disabled' do
		expect(items_page.fullscr_exs?).to be(false)
	end

  end
  
  context 'when valid credentials' do
	# Functional positive testing on the Items page
	
    it 'verifies user can type numbers in the quantities field' do
		data = 5
		items_page.quantity_enter(data)
		expect(items_page.quantity.text) == data.to_s
    end
	
	it 'verifies that user can click on the increment button' do
		data = 2
		items_page.quantity_enter(data)
		items_page.asc_btn.click
		expect(items_page.quantity.text) == (data + 1).to_s		
	end
	
	it 'verifies that user can click on the decrement button' do
		data = 2
		items_page.quantity_enter(data)
		items_page.desc_btn.click
		expect(items_page.quantity.text) == (data - 1).to_s		
	end
	
	it 'verifies that user can choose size' do
		items_page.size.click
		items_page.size_sub.click
		expect(items_page.size.text) == 'M'
	end
	
	
	it 'verifies that user can click on the photo on the subphotos' do
		items_page.subphoto.click
		expect(items_page.fullscr.displayed?).to be(true)
	end
	
	it 'verifies that user can click on the photo and see photo in the fullscreen' do
		items_page.fullscr_cls.click
		items_page.photo.click
		expect(items_page.fullscr.displayed?).to be(true)
	end
	
	it 'verifies that user can click on the next photo in the fullscreen ' do
		items_page.fullscr_nxt.click
		expect(items_page.fullscr.displayed?).to be(true)
	end
	
	it 'verifies that user can click on the previous photo in the fullscreen ' do
		items_page.fullscr_prev.click
		expect(items_page.fullscr.displayed?).to be(true)
	end
	
	it 'verifies that unathorized user can not add item to the wishlist' do
		items_page.fullscr_cls.click
		items_page.wishlist.click
		expect(items_page.item_alert.displayed?).to be(true)
	end
	
	it 'verifies that friend form is displayed' do
		items_page.fullscr_cls.click
		items_page.friend_btn.click
		expect(items_page.friend_form.displayed?).to be(true)
	end
	
	it 'verifies that user can send info to the friend' do
		name = 'Robb Stark'
		email = 'RStark@gameofthrones.com'
		items_page.add_form(name, email)
		items_page.send_btn.click
		expect(items_page.message.displayed?).to be(true)	
	end
	
	it 'verifies that information about product is displayed' do
		items_page.ok_btn.click
		items_page.cart_btn.click
		expect(items_page.layer_cart.displayed?).to be(true)
	end
	
	it 'verifies that user can abort order' do
		items_page.abort_btn.click
		expect(items_page.amount.text) == '(empty)'
	end
	
	it 'verifies that amount of items in the cart is switched' do
		data = 1
		items_page.cart_btn.click
		items_page.cont_btn.click
		expect(items_page.amount.text) == data.to_s + ' Product'
	end
	
	it 'verifies that after clicking on the continue button user will be on the item page' do
		items_page.cart_btn.click
		items_page.cont_btn.click
		expect(items_page.url_include?('controller=order')).to be(false)	
	end
	
	it 'verifies that user can add item to the cart and redirect to the order page' do
		items_page.cart_btn.click
		items_page.apply_btn.click
		expect(items_page.url_include?('controller=order')).to be(true)
	end
  end
end
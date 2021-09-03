require 'spec_helper'


RSpec.describe 'Items tab' do
  search_page = ItemsPage.new

  before(:all) do
    browser.get(PRODUCT)
  end

  after(:all) { browser.close } 
  
  context 'UI checking' do
	it 'verifies that quantities field is displayed' do
		expect(items_page.quantity.displayed?).to be(true)
	end
	
	it 'verifies that increment button is displayed' do
		expect(items_page.asc_btn.displayed?).to be(true)
			
	end
	
	it 'verifies that decrement button is displayed' do
		expect(items_page.desc_btn.displayed?).to be(true)
			
	end
	
	it 'verifies that photo is displayed' do
		expect(items_page.photo.displayed?).to be(true)
	end
	
	it 'verifies that size field is displayed' do
		expect(items_page.size.displayed?).to be(true)
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

  end
  
  context 'when valid credentials' do
    it 'verifies user can type numbers in the quantities field' do
		data = 5
		items_page.quantity_enter(data)
		expect(items_page.quantity.text).to_i == data
    end
	
	it 'verifies that user can click on the increment button' do
		data = 2
		items_page.quantity_enter(data)
		items_page.asc_btn.click
		expect(items_page.quantity.text).to_i == data + 1		
	end
	
	it 'verifies that user can click on the decrement button' do
		data = 2
		items_page.quantity_enter(data)
		items_page.desc_btn.click
		expect(items_page.quantity.text).to_i == data - 1		
	end
	
	it 'verifies that user can choose size' do
		items_page.size.click
		items_page.size_sub.click
		expect(items_page.size.text) == 'M'
	end
	
	it 'verifies that user can click on the photo and see photo in the fullscreen format' do
		items_page.photo.click
		expect(items_page.fullscr_photo.displayed?).to be(true)
	end
	
	it 'verifies that user can click on the next photo in the fullscreen format' do
		items_page.photo.click
		items_page.fullscr_nxt
		expect(items_page.fullscr_photo.displayed?).to be(true)
	end
	
	it 'verifies that user can click on the previous photo in the fullscreen format' do
		items_page.photo.click
		items_page.fullscr_prev
		expect(items_page.fullscr_photo.displayed?).to be(true)
	end
	
	it 'verifies that user can close fullscreen format by using close button' do
		items_page.photo.click
		items_page.fullscr_cls
		expect(items_page.fullscr_photo.displayed?).to be(false)
	end
	
	it 'verify that user can switch the subphotos by clicking on the scroll button' do
		items_page.view_scroll.click
		expect(items_page.subphoto.displayed?).to be(false)
	end
	
	it 'verify that user can go back to the previous subphotos by clicking on the scroll button' do
		items_page.view_scroll_lft.click
		expect(items_page.subphoto.displayed?).to be(true)
	end
	
	it 'verify that user can click on the subphoto and see the choosed photo in the fullscreen format'
		expect(items_page.fullscr_photo.displayed?).to be(true)
	end
	
	
  end
  
  context 'when invalid credentials' do
	it 'verifies that quantity can not be negative or zero by clicking on the decrement button' do
		data = 1
		items_page.quantity_enter(data)
		items_page.desc_btn.click
		expect(items_page.quantity.text).to_i == data	
	end

end
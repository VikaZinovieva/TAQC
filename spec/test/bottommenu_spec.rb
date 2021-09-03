require_relative '../spec_helper'


RSpec.describe 'Bottommenu' do
   landing_page = LandingPage.new
   botton = Bottommenu.new
   
    before(:all) do
    browser.get(HOME_PAGE)
    
  end

  after(:all) { browser.close }

  context 'Verify upon clicking category user is redirected to page' do

    it 'verifies open Women page' do
  
      botton.women_button.click
      expect(botton.url_include?('id_category=3&controller=category')).to be(true)

    end

    it 'verifies open New product page' do
  
      botton.button_new_products.click
      expect(botton.new_products.text) == 'New products'

    end
    it 'verifies open Special page ' do
      
      botton.button_spesial.click
      expect(botton.specials.text) == 'Price drop'

    end

  context 'UI bottom check'

    it 'verifies that women button is displayed' do

      expect(botton.women_button.displayed?).to be(true)

    end 
  end
end
#context 'UI bottom check'
#it 'verifies that specials button is displayed' do
  #expect(botton.specials_button.displayed?).to be(true)
#end 

#context 'UI bottom check'
#it 'verifies that new_products button is displayed' do
  #expect(botton.new_products_button.displayed?).to be(true)
#end 

#context 'UI bottom check'
#it 'verifies that our_stores button is displayed' do
  #expect(botton.our_stores_button.displayed?).to be(true)
#end 

#context 'UI bottom check'
#it 'verifies that contact_us_button is displayed' do
  #expect(botton.contact_us_button.displayed?).to be(true)
#end 

#context 'UI bottom check'
#it 'verifies that terms_and_conditions_of_use button is displayed' do
  #expect(botton.terms_and_conditions_of_use_button.displayed?).to be(true)
#end

#context 'UI bottom check'
#it 'verifies that about_us button is displayed' do
  #expect(botton.about_us._button.displayed?).to be(true)
#end


#rspec spec/test/bottommenu_spec.rb  --color --format doc 
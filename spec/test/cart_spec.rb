require_relative '../spec_helper'

RSpec.describe 'Cart page' do
  landing_page = LandingPage.new
  order_page = CartPage.new
  #cart_navigation = CartNavigation.new

  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.cart_button.click
  end

  after(:all) { browser.close }

  context 'Ui' do

    it 'verifies that cart button is displayed' do
      expect(header.shopping_cart.displayed?).to be(true)
    end

    it 'verifies that items in the cart are displayed' do
      expect(order_page.cart_product.displayed?).to be(true)
    end

    it 'verifies that add to cart button is displayed' do
      expect(women_page.add_to_cart_button.displayed?).to be(true)
    end

    it 'verifies that increment button is displayed' do
      expect(order_page.btn.button-plus.displayed?).to be(true)
    end

    it 'verifies that decrement button is displayed' do
      expect(order_page.btn.button-minus.displayed?).to be(true)
    end

    it 'verifies that delete button is displayed' do
      expect(order_page.cart_delete.displayed?).to be(true)
    end

    # it 'verifies that continue shopping button is displayed' do
    #   expect(cart_navigation.button-exclusive.text).to eq("Continue shopping")
    # end
    #
    # it 'verifies that proceed to checkout button is displayed' do
    #   expect(cart_navigation.button-medium span.text).to eq("Proceed to checkout")
    # end
  end

  context 'when valid credentials' do
    # it 'verifies click at cart button redirect to cart page' do
    #   header.shopping_cart.click
    #   expect(order_page.cart_product.displayed?).to be(true)
    # end

    it 'verifies that items can be added to the cart' do
      # women_page.add_to_cart_button.click
      # header.shopping_cart.click
      # expect(order_page.cart_product.displayed?).to be(true)
    end

    it 'verifies user can type numbers in the quantities field' do
      data = 42
      order_page.cart_quantity_input(data)
      expect(order_page.quantity.text).to_i == data
    end

    it 'verifies that click on the increment button increase quantity by one unit' do
      data = 1
      order_page.cart_quantity_input(data)
      order_page.btn.button-plus.click
      expect(order_page.cart_quantity_input.text).to_i == data + 1
    end

    it 'verifies that click on the decrement button decrease quantity by one unit' do
      data = 1
      order_page.cart_quantity_input(data)
      order_page.btn.button-minus.click
      expect(order_page.cart_quantity_input.text).to_i == data - 1
    end

    it 'verifies that click on the delete button removes item' do
      order_page.cart_delete.click
      expect(header.shopping_cart.displayed?).to be(true)
    end

    it 'verify that after clicking on the Continue shopping button redirects to the landing page' do
      current_url = browser.current_url
      #cart_navigation.button-exclusive.click
      order_page.wait_for{ current_url != browser.current_url }
      expect(landing_page.url_include?('id_category=8')).on page?(true)
    end

    it 'verify that after clicking on the proceed to checkout button open address widget' do
      current_url = browser.current_url
      #cart_navigation.button-medium span.click
      order_page.wait_for{ current_url != browser.current_url }
      expect(order_page.step_current.displayed?).to be(true)
    end

    context 'when invalid credentials' do
      it 'verifies with empty cart after clicking on the proceed to checkout button address widget will not appear' do
        #cart_navigation.button-medium span.click
        expect(order_page.alert.displayed?).to be(true)
      end
    end
  end
end

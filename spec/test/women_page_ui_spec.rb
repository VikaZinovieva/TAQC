require_relative '../spec_helper'

RSpec.describe 'Women page' do
  landing_page = LandingPage.new
  women_page = WomenPage.new

  titles = ["Categories", "Size", "Color", "Compositions", "Styles", "Properties", "Availability", "Manufacturer", "Condition"]
  categories = ["Tops", "Dresses"]
  size = ["S", "M", "L"]
  color = ["Beige", "White", "Black", "Orange", "Blue", "Green", "Yellow", "Pink"]
  compositions = ["Cotton", "Polyester", "Viscose"]
  styles = ["Casual", "Dressy", "Girly"]
  properties = ["Colorful Dress", "Maxi Dress", "Midi Dress", "Short Dress", "Short Sleeve"]
  availability = ["In stock"]
  manufacturer = ["Fashion Manufacturer"]
  condition = ["New"]
    
  before(:all) do
    browser.get(HOME_PAGE)
    landing_page.women_button.click
  end

  after(:all) { browser.close }

  it 'verifies title displayed' do
    expect(women_page.page_title.text).to include(WomenPage::PAGE_TITLE)
  end


  context "Categories filter with all options" do

    it 'verifies Categories filter title displayed' do
      expect(women_page.categories_filter.text).to eq(titles[0])
    end

    it 'verifies Categories filter Tops option displayed' do
      expect(women_page.categories_filter_tops.text).to include(categories[0])  
    end

    it 'verifies Categories filter Dresses option displayed' do
      expect(women_page.categories_filter_dresses.text).to include(categories[1]) 
    end
  end


  context "Size filter with all options" do

    it 'verifies Size filter title displayed' do
      expect(women_page.size_filter.text).to eq(titles[1])
    end

    it 'verifies Size filter S option displayed' do
      expect(women_page.size_filter_s.text).to include(size[0])
    end

    it 'verifies Size filter M option displayed' do
      expect(women_page.size_filter_m.text).to include(size[1])
    end

    it 'verifies Size filter L option displayed' do
      expect(women_page.size_filter_l.text).to include(size[2])
    end
  end


  context "Color filter with all options" do

    it 'verifies Color filter title displayed' do
      expect(women_page.color_filter.text).to eq(titles[2])
    end

    it 'verifies Color filter Biege option displayed' do
      expect(women_page.color_filter_beige.text).to include(color[0])
    end

    it 'verifies Color filter White option displayed' do
      expect(women_page.color_filter_white.text).to include(color[1])
    end

    it 'verifies Color filter Black option displayed' do
      expect(women_page.color_filter_black.text).to include(color[2])
    end

    it 'verifies Color filter Orange option displayed' do
      expect(women_page.color_filter_orange.text).to include(color[3])
    end

    it 'verifies Color filter Blue option displayed' do
      expect(women_page.color_filter_blue.text).to include(color[4])
    end

    it 'verifies Color filter Green option displayed' do
      expect(women_page.color_filter_green.text).to include(color[5])
    end

    it 'verifies Color filter Yellow option displayed' do
      expect(women_page.color_filter_yellow.text).to include(color[6])
    end

    it 'verifies Color filter Pink option displayed' do
      expect(women_page.color_filter_pink.text).to include(color[7])
    end
  end


  context "Compositions filter with all options" do

    it 'verifies Compositions filter title displayed' do
      expect(women_page.compositions_filter.text).to eq(titles[3])
    end

    it 'verifies Compositions filter Cotton option displayed' do
      expect(women_page.compositions_filter_cotton.text).to include(compositions[0])
    end

    it 'verifies Compositions filter Polyester option displayed' do
      expect(women_page.compositions_filter_polyester.text).to include(compositions[1])
    end

    it 'verifies Compositions filter Viscose option displayed' do
      expect(women_page.compositions_filter_viscose.text).to include(compositions[2])
    end
  end


  context "Styles filter with all options" do
    it 'verifies Styles filter title displayed' do
      expect(women_page.styles_filter.text).to eq(titles[4])
    end

    it 'verifies Styles filter Casual option displayed' do
      expect(women_page.styles_filter_casual.text).to include(styles[0])
    end

    it 'verifies Styles filter Dressy option displayed' do
      expect(women_page.styles_filter_dressy.text).to include(styles[1])
    end

    it 'verifies Styles filter Girly option displayed' do
      expect(women_page.styles_filter_girly.text).to include(styles[2])
    end
  end


  context "Properties filter with all options" do

    it 'verifies properties filter title displayed'do
      expect(women_page.properties_filter.text).to eq(titles[5])
    end

    it 'verifies Properties filter Colorful Dress option displayed'do
      expect(women_page.properties_filter_colorfulDress.text).to include(properties[0])
    end

    it 'verifies Properties filter Maxi Dress option displayed'do
      expect(women_page.properties_filter_maxiDress.text).to include(properties[1])
    end

    it 'verifies Properties filter Midi Dress option displayed'do
      expect(women_page.properties_filter_midiDress.text).to include(properties[2])
    end

    it 'verifies Properties filter Short Dress option displayed'do
      expect(women_page.properties_filter_shortDress.text).to include(properties[3])
    end

    it 'verifies Properties filter Short Sleeve option displayed'do
      expect(women_page.properties_filter_shortSleeve.text).to include(properties[4])
    end
  end


  context "Availability filter with all options" do

    it 'verifies Availability filter title displayed'do
      expect(women_page.availability_filter.text).to eq(titles[6])
    end

    it 'verifies Availability filter In Stock option displayed' do
      expect(women_page.availability_filter_inStock.text).to include("In stock")
    end
  end


  context "Manufacturer filter with all options" do

    it 'verifies Manufacturer filter title displayed' do
      expect(women_page.manufacturer_filter.text).to eq(titles[7])
    end

    it 'verifies Manufacturer filter Fashion Manufacturer option displayed' do
      expect(women_page.manufacturer_filter_fashionManufacturer.text).to include(manufacturer[0])
    end
  end

  context "verifies Condition filter with all options" do

    it 'verifies Condition filter title displayed' do
      expect(women_page.condition_filter.text).to eq(titles[8])
    end

    it 'verifies Condition filter New option displayed' do
      expect(women_page.condition_filter_new.text).to include(condition[0])
    end
  end

end
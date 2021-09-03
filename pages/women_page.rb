class WomenPage
    PAGE_TITLE = 'WOMEN'

    def page_title
        #TBD to move to parent page
        browser.find_element(class: 'cat-name')
    end

#TITLES OF CATEGORIES
    def filter_finding(text)
        browser.find_element(xpath: "//span[contains(@class,'layered_subtitle') and text()='#{text}']")
    end

    def categories_filter
        filter_finding("Categories")
    end

    def size_filter
        filter_finding("Size")
    end

    def color_filter
        filter_finding("Color")
    end

    def compositions_filter
        filter_finding("Compositions")
    end

    def styles_filter
        filter_finding("Styles")
    end

    def properties_filter
        filter_finding("Properties")
    end

    def availability_filter
        filter_finding("Availability")
    end

    def manufacturer_filter
        filter_finding("Manufacturer")
    end

    def condition_filter
        filter_finding("Condition")
    end

#OPTIONS OF CATEGORIES
    def categories_filter_tops
        #browser.find_element(xpath: "//label/a[text()='Tops']")
        browser.find_element(css:"#ul_layered_category_0 label[for='layered_category_4']")
    end

    def categories_filter_dresses
        browser.find_element(css:"#ul_layered_category_0 label[for='layered_category_8']")
    end

#OPTIONS OF SIZE
    def size_filter_s
        browser.find_element(css:"#ul_layered_id_attribute_group_1 label[for='layered_id_attribute_group_1']")
    end

    def size_filter_m
        browser.find_element(css:"#ul_layered_id_attribute_group_1 label[for='layered_id_attribute_group_2']")
    end

    def size_filter_l
        browser.find_element(css:"#ul_layered_id_attribute_group_1 label[for='layered_id_attribute_group_3']")
    end

# OPTIONS OF COLOR
def color_finding(val)
    browser.find_element(css:"#ul_layered_id_attribute_group_3 label[for='layered_id_attribute_group_#{val}']")
end

def color_filter_beige
    #browser.find_element(xpath: "//label/a[text()='Beige']")
    #browser.find_element(css:"#ul_layered_id_attribute_group_3 label[for='layered_id_attribute_group_7']")
    color_finding(7)
end

def color_filter_white
    color_finding(8)
end

def color_filter_black
    color_finding(11)
end

def color_filter_orange
    color_finding(13)
end

def color_filter_blue
    color_finding(14)
end

def color_filter_green
    color_finding(15)
end

def color_filter_yellow
    color_finding(16)
end

def color_filter_pink
    color_finding(24)
end

# OPTIONS OF COMPOSITIONS
def compositions_filter_cotton
    browser.find_element(xpath: "//label/a[text()='Cotton']")
end

def compositions_filter_polyester
    browser.find_element(xpath: "//label/a[text()='Polyester']")
end

def compositions_filter_viscose
    browser.find_element(xpath: "//label/a[text()='Viscose']")
end

# OPTIONS OF STYLES
def styles_filter_casual
    browser.find_element(xpath: "//label/a[text()='Casual']")
end

def styles_filter_dressy
    browser.find_element(xpath: "//label/a[text()='Dressy']")
end

def styles_filter_girly
    browser.find_element(xpath: "//label/a[text()='Girly']")
end

# OPTIONS OF PROPERTIES
def properties_filter_colorfulDress
    browser.find_element(xpath: "//label/a[text()='Colorful Dress']")
end

def properties_filter_maxiDress
    browser.find_element(xpath: "//label/a[text()='Maxi Dress']")
end

def properties_filter_midiDress
    browser.find_element(xpath: "//label/a[text()='Midi Dress']")
end

def properties_filter_shortDress
    browser.find_element(xpath: "//label/a[text()='Short Dress']")
end

def properties_filter_shortSleeve
    browser.find_element(xpath: "//label/a[text()='Short Sleeve']")
end

# OPTIONS OF AVAILABILITY
def availability_filter_inStock
    browser.find_element(xpath: "//label/a[text()='In stock']")
end

# OPTIONS OF MANUFACTURER
def manufacturer_filter_fashionManufacturer
    browser.find_element(xpath: "//label/a[text()='Fashion Manufacturer']")
end

# OPTIONS OF CONDITION
def condition_filter_new
    browser.find_element(xpath: "//label/a[text()='New']")
end

# OPTIONS OF PRICE

end
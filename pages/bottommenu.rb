class Bottommenu < BasePage

 #Categories
    def categories_conteiner
     browser.find_element(id: 'footer')
    end
    
    def women_button
        categories_conteiner.find_element(css: '.list a')
    end 


  #Information
    def specials
      browser.find_element(class: 'product-listing')
    end
  
    def new_products
      browser.find_element(class: 'product-listing')
    end

    def our_stores
        browser.find_element(class: 'product-listing')
    end
    
    def contact_us
        browser.find_element(class: 'product-listing')
    end

    def terms_and_conditions_of_use
        browser.find_element(class: 'product-listing')
    end

    def about_us
        browser.find_element(class: 'product-listing')
    end   
 #My account
    def my_orders
        browser.find_element(name: 'My orders')
    end

    def my_credit_slips
        browser.find_element(name: 'My credit slips')
    end

    def my_addresses
        browser.find_element(name: 'My addresses')
    end

    def my_personal_info
        browser.find_element(name: 'My personal info')
    end
     
    def button_spesial
        browser.find_element(xpath: '//li[@class = "item"]/a[@title = "Specials"]')
    end
    def button_new_products
        browser.find_element(xpath: '//li[@class = "item"]/a[@title = "New products"]')
    end
end




#xpath: "//a[@class='selected']"

#xpath: '//div[@class = "breadcrumb clearfix"]/span[@class = "navigation_page]'
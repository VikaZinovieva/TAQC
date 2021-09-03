class Botommmenu_2 #url в браузере будет иметь в себе текст соответсующий категории 
    def on_page? #url woman
        browser.current_url.include? 'category'
    end

    def on_page? #url prices-drop
        browser.current_url.include? 'prices-drop'
    end

    def on_page? # new-products
        browser.current_url.include? 'new-products'
    end

    def on_page? # best-sales
        browser.current_url.include? 'best-sales'
    end

    def on_page? # stores
        browser.current_url.include? 'stores'
    end

    def on_page? # contact
        browser.current_url.include? 'contact'
    end

    def on_page? # cms Terms and conditions of use
        browser.current_url.include? 'cms'
    end

    def on_page? # cms ABOUT US
        browser.current_url.include? 'cms'
    end

    def on_page? # sitemap
        browser.current_url.include? 'sitemap'
    end

    def on_page? # history My orders
        browser.current_url.include? 'history'
    end

    def on_page? # order-slip My credit slips
        browser.current_url.include? 'order-slip'
    end

    def on_page? # addresses My addresses
        browser.current_url.include? 'addresses'
    end

    def on_page? # identity My personal info
        browser.current_url.include? 'identity'
    end
end


#context 'UI bottom check'
   # it 'verifies that women button is displayed'
        #expect(botton.women_button.displayed?).to be(true)
    #end 
  #end
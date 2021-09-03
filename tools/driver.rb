require 'selenium/webdriver'
require 'rspec'
require 'capybara'
require 'cucumber'

class Driver
  def initialize
   $driver = Selenium::WebDriver.for :firefox
   $driver.manage.timeouts.implicit_wait = 10 # seconds
  end
end

Driver.new

def browser
  $driver
end


require 'selenium/webdriver'

class Driver
  def initialize
    $driver = Selenium::WebDriver.for :chrome
    $driver.manage.timeouts.implicit_wait = 10 # seconds
  end
end

Driver.new

def browser
  $driver
end


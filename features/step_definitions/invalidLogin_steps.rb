require 'selenium-webdriver'
path = '/Users/viktoriazinoveva/Documents/TAQC/drivers/chromedriver'

Given(/^I open a browser$/) do
  @browser = Selenium:: WebDriver.for(:chrome, driver_path: path)
  url = 'http://automationpractice.com/index.php?controller=authentication'
    @browser.navigate.to url
  end

When(/^I login with user login 'vikapika@gmail\.com' and password '\*\*\*\*'$/) do
  @browser.find_element(xpath: "//input [@id='email']").send_keys email
  @browser.find_element(xpath: "//<input [@id='passwrd']" ).send_keys password
  @browser.find_element(xpath: "//<button [@id='submitlogin']" ).click
end

Then(/^I verify Alert message is shown$/) do
  @browser.find_ement(xpath: "//div [@class='alert alert-danger']")
end

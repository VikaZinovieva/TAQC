path = '/Users/viktoriazinoveva/Documents/TAQC/drivers/geckodriver'
Given (/ ^I open a browser$/ ) do
  @browser = Selenium :: WebDriver.for(:chrome, driver_path: path)
  url = 'http://automationpractice.com'
  @browser.navigate.to url
end

When(/^I login with user name "([^"]*)" and password "([^"]"$/) do |username, pasword|
  @browser.find_element (xpath: "//input [@id='email']").send_keys username
  @browser.find_element (xpath: "//input [@id='passwrd']").send_keys pasword
  @browser.find_element (xpath: "//input [@id='SubmitLogin']").click
  end

  Then (/^I verify automationpractice page loaded$/)do
    @browser.find_element (xpath: "/input [@id='my-account']")
  end
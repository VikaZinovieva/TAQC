Feature: Basic authentication
  @test1
  Scenario: User with valid credentials can login
    Given I open a browser
    When I login with user login 'adia1991@bk.ru' and password '1234QWER'
    Then  I verify My account page loaded
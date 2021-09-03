Feature: Basic autentification

  Scenario: User with valid credentials can login
    Given I open a browser
    When I login with email "adia1991@bk.ru" and passswod "1234QWER"
    Then I  verify automationpractice page loaded
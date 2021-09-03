Feature: Authentication with invalid credentials
@test2
  Scenario: User with invalid credentials can't login
    Given I open a browser
    When I login with user login 'vikapika@gmail.com' and password '****' #
    Then  I verify Alert message is shown
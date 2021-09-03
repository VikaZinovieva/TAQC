Feature: Invalid authentication
  @test3
  Scenario: User with valid credentials can login
    Given I open a browser
    When I leave login and password empty
    Then  I verify Alert message is shown
Feature: Starting the form

  Scenario: Homepage link takes user to the start of the form
    Given I am on the application index
    And I click Continue
    Then I should see 'Tell us about yourself'

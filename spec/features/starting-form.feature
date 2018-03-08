Feature: Starting the form

  Scenario: Homepage link takes user to the start of the form
    Given I am on the eligibility index
    And I click Continue
    Then I should see 'Type of fostering'

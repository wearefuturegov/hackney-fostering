Feature: Spare Room

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the spare room step of the eligibility form
    
  Scenario: I have a spare room
    And I check the 'Yes' option
    Then I should be on the 'housing_type' step
    And my application should be marked as eligible

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'other_ways' step
    And my application should be marked as ineligible
    
  Scenario: Not yet redirects correctly
    And I check the 'Not yet' option
    Then I should be on the 'other_ways' step
    And my application should be marked as ineligible

@javascript
Feature: Over 21

  Background:
    Given I have started an application
    And I am answering the age step of the eligibility form
    
  Scenario: Yes redirects correctly
    And I check the 'Yes' option
    Then I should be on the 'spare_room' step
    
  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'other_ways' step

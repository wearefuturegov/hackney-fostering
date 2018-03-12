Feature: Spare Room

  Background:
    Given I have started an application
    And I am answering the spare room step of the eligibility form
    
  Scenario: I have a spare room
    And I check the 'yes' option
    Then I should be on the 'over_21' step

  Scenario: No redirects correctly
    And I check the 'no' option
    Then I should be on the 'other_ways' step
    
  Scenario: Not yet redirects correctly
    And I check the 'not_yet' option
    Then I should be on the 'other_ways' step

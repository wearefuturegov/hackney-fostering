Feature: Spare Room

  Background:
    Given I have started a form
    And I am answering the spare room step
    
  Scenario: I have a spare room
    And I check the 'yes' option
    Then I should be on the 'what_is_your_name' step

  Scenario: Non-Practicing redirects correctly
    And I check the 'no' option
    Then I should be on the 'other_ways' step
    
  Scenario: Non-Practicing redirects correctly
    And I check the 'not_yet' option
    Then I should be on the 'other_ways' step

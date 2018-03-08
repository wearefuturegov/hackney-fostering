Feature: Filling out form

  Background:
    Given I have started a form
    
  Scenario: Answering first question
    When I check the 'emergency_fostering' option
    Then I should see 'Do you have a spare room?'
    And my response should be stored

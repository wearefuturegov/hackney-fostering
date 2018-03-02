Feature: Filling out form

  Background:
    Given I have started a form
    
  Scenario: Answering first question
    Given I answer the first question
    Then I should see 'Gender'
    And my response should be stored
    

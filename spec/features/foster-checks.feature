Feature: Filling out form

  Background:
    Given I have started a form
    
  Scenario: Answering first question
    Given I answer the first question
    Then I should see 'Gender'
    And my response should be stored
    
  Scenario: Practicing redirects correctly
    Given I am answering the are you practicing step
    And I check the 'Practicing' option
    Then I should be on the 'what_do_you_practice' step

  Scenario: Practicing redirects correctly
    Given I am answering the are you practicing step
    And I check the 'Non-practicing' option
    Then I should be on the 'language' step
    

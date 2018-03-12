@pending
Feature: Are you practicing

  Background:
    Given I have started an application
    And I am answering the are you practicing step
    
  Scenario: Practicing redirects correctly
    And I check the 'Practicing' option
    Then I should be on the 'what_do_you_practice' step

  Scenario: Non-Practicing redirects correctly
    And I check the 'Non-practicing' option
    Then I should be on the 'language' step
    

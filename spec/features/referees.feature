@javascript
Feature: Previous Addresses
  
  Background:
    Given I have started an application
    And I am adding a referee
  
  Scenario: Adding a single referee
    When I add a referee
    Then my referee should be saved
    And I should be on the 'name' step
    
  Scenario: Adding all referees
    When I add 6 referees
    Then my referees should be saved
  

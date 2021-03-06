@javascript
Feature: Referees
  
  Background:
    Given I have started an application
    And I am logged in
    And I am adding a referee
  
  Scenario: Adding a single referee
    When I add a referee
    Then my referee should be saved
    
  Scenario: Adding all referees
    When I add 6 referees
    Then my referees should be saved
    And I should be on the 'intro' step

Feature: Start with code

  Background:
    Given I have started an application
    And I am on the applications
    
  Scenario: Starting an application with the correct code
    And I enter the correct code
    Then I should be on the 'name_change' step
  
  Scenario: Incorrect code
    And I enter an incorrect code
    Then I should see an invalid code error

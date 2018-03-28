Feature: Save Progress

  Background:
    Given I have started an application
    And I am answering the adults living at home step of the you and your family form
  
  Scenario: Takes me back to the correct step
    And I am on the applications
    And I enter the correct code
    Then I should be on the 'adults_living_at_home' step

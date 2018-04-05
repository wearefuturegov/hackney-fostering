@javascript
Feature: Pets

  Background:
    Given I have started an application
    And I am answering the pets step of the you and your family form
    
  Scenario: Yes redirects to number of pets
    And I check the 'Yes' option
    Then I should be on the 'number_of_pets' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'breed_pets' step
    

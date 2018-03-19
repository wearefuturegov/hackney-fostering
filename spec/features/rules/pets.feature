@javascript
Feature: Pets

  Background:
    Given I have started an application
    And I am answering the pets step of the full application form
    
  Scenario: Yes redirects to add a new pet
    And I choose 2 pets
    And I check the 'Yes' option
    Then I should be on the 'type' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'breed_pets' step
    

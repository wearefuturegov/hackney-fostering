@javascript
Feature: Adding pets

  Background:
    Given I have started an application
    And I am answering the pets step of the full application form
    
  Scenario: One pet
    And I fill in the details for 1 pet
    Then I should have 1 pet recorded
    And I should be on the 'breed_pets' step

  Scenario: More than one adult living elsewhere
    And I fill in the details for 3 pets
    Then I should have 3 pets recorded
    And I should be on the 'breed_pets' step

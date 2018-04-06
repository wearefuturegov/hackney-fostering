@javascript
Feature: Adding adults living elsewhere

  Background:
    Given I have started an application
    And I am answering the adults elsewhere step of the you and your family form
    
  Scenario: One adult living elsewhere
    And I fill in the details for 1 adult living elsewhere
    Then I should have 1 adult living elsewhere recorded
    And I should be on the 'pets_welcome' step

  Scenario: More than one adult living elsewhere
    And I fill in the details for 3 adults living elsewhere
    Then I should have 3 adults living elsewhere recorded
    And I should be on the 'pets_welcome' step

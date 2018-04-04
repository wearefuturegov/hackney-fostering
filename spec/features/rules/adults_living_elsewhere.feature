@javascript
Feature: Adults living elsewhere

  Background:
    Given I have started an application
    And I am answering the adults living elsewhere step of the you and your family form
    
  Scenario: Yes redirects to add adults
    And I check the 'Yes' option without submitting
    And I choose 2 adults living elsewhere
    Then I should be on the 'name' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'pets' step
    

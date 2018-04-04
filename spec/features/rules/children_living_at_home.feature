@javascript
Feature: Children living at home

  Background:
    Given I have started an application
    And I am answering the children living at home step of the you and your family form
    
  Scenario: Yes redirects to add children
    And I check the 'Yes' option without submitting
    And I choose 2 children
    Then I should be on the 'name' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'children_living_elsewhere' step
    

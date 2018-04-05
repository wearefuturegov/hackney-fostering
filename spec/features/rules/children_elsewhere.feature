@javascript
Feature: Children living elsewhere

  Background:
    Given I have started an application
    And I am answering the children elsewhere step of the you and your family form
    
  Scenario: Yes redirects to add children
    And I check the 'Yes' option
    Then I should be on the 'children_living_elsewhere' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'adults_at_home' step
    

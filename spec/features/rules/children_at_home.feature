@javascript
Feature: Children living at home

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the children at home step of the you and your family form
    
  Scenario: Yes redirects to add children
    And I check the 'Yes' option
    Then I should be on the 'children_living_at_home' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'children_elsewhere' step
    

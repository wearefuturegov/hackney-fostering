@javascript
Feature: Adding children

  Background:
    Given I have started an application
    And I am answering the children at home step of the you and your family form
    
  Scenario: One child
    And I fill in the details for 1 child
    Then I should have 1 child recorded
    And I should be on the 'children_elsewhere' step

  Scenario: More than one child
    And I fill in the details for 3 children
    Then I should have 3 children recorded
    And I should be on the 'children_elsewhere' step

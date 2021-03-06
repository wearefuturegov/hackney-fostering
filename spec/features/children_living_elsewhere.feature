@javascript
Feature: Adding children living elsewhere

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the children elsewhere step of the you and your family form
    
  Scenario: One child living elsewhere
    And I fill in the details for 1 child living elsewhere
    Then I should have 1 child living elsewhere recorded
    And I should be on the 'adults_at_home' step

  Scenario: More than one child living elsewhere
    And I fill in the details for 3 children living elsewhere
    Then I should have 3 children living elsewhere recorded
    And I should be on the 'adults_at_home' step

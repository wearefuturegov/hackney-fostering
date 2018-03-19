@javascript
Feature: Adding children

  Background:
    Given I have started an application
    And I am answering the adults living at home step of the full application form
    
  Scenario: One child
    And I fill in the details for 1 adult
    Then I should have 1 adult recorded
    And I should be on the 'adults_living_elsewhere' step

  Scenario: More than one child
    And I fill in the details for 2 adults
    Then I should have 2 adults recorded
    And I should be on the 'adults_living_elsewhere' step

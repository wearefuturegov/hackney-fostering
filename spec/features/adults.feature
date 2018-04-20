@javascript
Feature: Adding adults

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the adults at home step of the you and your family form
    
  Scenario: One adult
    And I fill in the details for 1 adult
    Then I should have 1 adult recorded
    And I should be on the 'adults_elsewhere' step

  Scenario: More than one adult
    And I fill in the details for 2 adults
    Then I should have 2 adults recorded
    And I should be on the 'adults_elsewhere' step

@javascript
Feature: Adults living at home

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the adults at home step of the you and your family form
    
  Scenario: Yes redirects to add adults
    And I check the 'Yes' option
    Then I should be on the 'adults_living_at_home' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'adults_elsewhere' step
    

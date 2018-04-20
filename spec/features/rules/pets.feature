@javascript
Feature: Pets

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the pets step of the you and your family form
    
  Scenario: No redirects to add a support carer
    And I check the 'No' option
    Then I should be on the 'intro' step

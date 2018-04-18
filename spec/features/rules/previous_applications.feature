@javascript
Feature: Previous Applications

  Background:
    Given I have started an application
    And I am answering the previous applications step of the legal history form
    
  Scenario: Yes redirects to give more information
    And I check the 'Yes' option
    Then I should be on the 'application_date' step

  Scenario: No redirects to the next section
    And I check the 'No' option
    Then I should be on the 'other_previous_applications' step
    

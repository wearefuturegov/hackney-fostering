Feature: Previous Applications

  Background:
    Given I have started an application
    And I am answering the previous fostering step of the legal history form
    
  Scenario: Yes redirects to give more information
    And I check the 'Yes' option
    Then I should be on the 'previous_agency_name' step
    
  Scenario: No redirects to the consent step
    And I check the 'No' option
    Then I should be on the confirmation page

Feature: Employment Type

  Background:
    Given I have started an application
    And I am answering the employment history step of the full application form
    
  Scenario: Full Time redirects correctly
    And I check the 'full_time' option
    Then I should be on the 'national_insurance' step

  Scenario: Unemployed redirects correctly
    And I check the 'unemployed' option
    Then I should be on the 'address' step
    

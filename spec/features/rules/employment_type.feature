Feature: Employment Type

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the employment history step of the you and your family form
    
  Scenario: Full Time redirects correctly
    And I check the 'Full time' option
    Then I should be on the 'national_insurance' step

  Scenario: Unemployed redirects correctly
    And I check the 'Unemployed' option
    Then I should be on the 'full_address' step
    

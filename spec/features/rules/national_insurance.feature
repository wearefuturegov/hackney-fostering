Feature: Employment Type

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the employment history step of the you and your family form
    
  Scenario: Full Time redirects correctly
    And I check the 'Full time' option
    And I enter my national insurance number
    Then I should be on the 'occupation' step

  Scenario: Unemployed redirects correctly
    And I check the 'Unemployed' option
    And I enter my national insurance number
    Then I should be on the 'full_address' step
    

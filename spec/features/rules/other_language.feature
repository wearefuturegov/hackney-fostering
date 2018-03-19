Feature: Other languages

  Background:
    Given I have started an application
    And I am answering the other language step of the full application form
  
  Scenario: Yes redirects correctly
    And I check the 'Yes' option
    Then I should be on the 'other_language_select' step
    
  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'are_you_religious' step

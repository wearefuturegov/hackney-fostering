Feature: Name Change

  Background:
    Given I have started an application
    And I am answering the name change step of the you and your family form
    
  Scenario: Yes redirects correctly
    And I check the 'Yes' option
    Then I should be on the 'what_is_your_name_change' step
    
  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'gender' step

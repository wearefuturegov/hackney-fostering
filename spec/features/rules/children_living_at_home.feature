Feature: Children living at home

  Background:
    Given I have started an application
    And I am answering the children living at home step of the full application form
    
  Scenario: Yes redirects to add children
    And I check the 'Yes' option
    Then I should be on the 'name' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'children_living_elsewhere' step
    

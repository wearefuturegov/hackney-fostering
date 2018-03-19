@javascript
Feature: Children living elsewhere

  Background:
    Given I have started an application
    And I am answering the children living elsewhere step of the full application form
    
  Scenario: Yes redirects to add children
    And I choose 2 children living elsewhere
    And I check the 'Yes' option
    Then I should be on the 'name' step

  Scenario: No redirects correctly
    And I check the 'No' option
    Then I should be on the 'adults_living_at_home' step
    

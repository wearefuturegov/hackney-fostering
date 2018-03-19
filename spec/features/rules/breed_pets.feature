Feature: Breeding Pets

  Background:
    Given I have started an application
    And I am answering the breed pets step of the full application form
    
  Scenario: Yes redirects correctly
    And I check the 'Yes' option
    Then I should be on the 'where_breed_pets' step
    

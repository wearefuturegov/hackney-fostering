@javascript
Feature: Previous Addresses
  
  Background:
    Given I have started an application
    And I am answering the previous addresses step of the full application form
    
  Scenario: One previous address
    When I fill in my address and a moved in date of 7 years ago
    Then I should have 1 previous address
    And I should be on the 'adults_living_at_home' step
    
  Scenario: Multiple previous addresses
    When I fill in my address and a moved in date of 1 years ago
    And I fill in my address and a moved in date of 3 years ago
    And I fill in my address and a moved in date of 5 years ago
    Then I should have 3 previous addresses
    And I should be on the 'adults_living_at_home' step

    
  

@javascript
Feature: Previous Addresses
  
  Background:
    Given I have started an application
    And I am logged in
    And I am answering the previous addresses step of the you and your family form
    
  Scenario: One previous address
    When I fill in my address and a moved in date of 7 years ago
    Then I should have 1 previous address
    And I should be on the 'your_family' step

  Scenario: One previous address with manual entry
    When I fill in my address manually with a moved in date of 7 years ago
    Then I should have 1 previous address
    And I should be on the 'your_family' step
    
  Scenario: Multiple previous addresses
    When I fill in my address and a moved in date of 1 years ago
    And I fill in my address and a moved in date of 3 years ago
    And I fill in my address and a moved in date of 5 years ago
    Then I should have 3 previous addresses
    And I should be on the 'your_family' step
    
  Scenario: Multiple previous addresses with manual entry
    When I fill in my address and a moved in date of 1 years ago
    And I fill in my address manually with a moved in date of 2 years ago
    And I fill in my address manually with a moved in date of 5 years ago
    Then I should have 3 previous addresses
    And I should be on the 'your_family' step
  

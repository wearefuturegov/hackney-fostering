@javascript
Feature: Previous addresses

  Background:
    Given I have started an application
    And I am logged in
    And I am answering the full address step of the you and your family form
    
  Scenario: One previous address
    When I fill in my address and a moved in date of 7 years ago
    Then I should be on the 'your_family' step
    
  Scenario: More than one previous address
    When I fill in my address and a moved in date of 1 year ago
    Then I should be on the 'previous_addresses' step


    

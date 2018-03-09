@javascript @pending
Feature: Previous addresses

  Background:
    Given I have started a form
    And I am answering the previous addresses step
    
  Scenario: One previous address
    When I fill in my address
    And I enter a moved in date of 7 years ago
    Then I should be on the 'children_living_at_home' step
    And I should have 1 previous address
    
  Scenario: More than one previous address
    When I fill in my address
    And I enter a moved in date of 1 year ago
    Then I should be on the 'previous_addresses' step
    And I enter another address with a moved in date of 3 years ago
    Then I should be on the 'previous_addresses' step
    And I enter another address with a moved in date of 7 years ago
    Then I should be on the 'children_living_at_home' step
    And I should have 3 previous address


    

@javascript @pending
Feature: Previous addresses

  Background:
    Given I have started an application
    And I am answering the address period step of the full application form
    
  Scenario: One previous address
    When I enter a moved in date of 7 years ago
    Then I should be on the 'adults_living_at_home' step
    
  Scenario: More than one previous address
    When I enter a moved in date of 1 year ago
    Then I should be on the 'previous_addresses' step


    

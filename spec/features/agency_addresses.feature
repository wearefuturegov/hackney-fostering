@javascript
Feature: Entering addresses for agencies

  Background:
    Given I have started an application
    And I am logged in
  
  Scenario: Entering the agency's address
    When I am answering the agency address step of the legal history form
    And I fill in an address
    Then my agency address should be saved in the database

  Scenario: Entering the other agency's address
    When I am answering the other agency address step of the legal history form
    And I fill in an address
    Then my other agency address should be saved in the database

  Scenario: Entering the previous agency's address
    When I am answering the previous agency address step of the legal history form
    And I fill in an address
    Then my previous agency address should be saved in the database

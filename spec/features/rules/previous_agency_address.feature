@javascript
Feature: Previous Applications

  Background:
    Given I have started an application
    And I am answering the previous agency address step of the legal history form
    
  Scenario: Redirects to the consent step
    And I fill in an address
    Then I should be on the confirmation page

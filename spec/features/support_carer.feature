@javascript
Feature: Support Carer
  
  Background:
    Given I have started an application
    And I am answering the intro step of the support carer form
  
  Scenario: Adding a support carer
    When I add a support carer
    Then my support carer should be saved
    

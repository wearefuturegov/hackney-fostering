Feature: Are you practicing

  Background:
    Given I have started an application
    And I am answering the are you religious step of the you and your family form
    
  Scenario: Practicing redirects correctly
    And I check the 'Yes' option
    Then I should be on the 'what_is_your_religion' step

  Scenario: Non-Practicing redirects correctly
    And I check the 'No' option
    Then I should be on the 'welcome_working' step
    

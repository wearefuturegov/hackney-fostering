Feature: Experience

  Background:
    Given I have started an application
    And I am answering the experience step of the eligibility form
    
  Scenario: Experience redirects correctly
    And I check the 'Very experienced' option
    Then I should be on the 'age_experience' step

  Scenario: Unemployed redirects correctly
    And I check the 'No experience' option
    Then I should be on the 'be_in_touch' step
    

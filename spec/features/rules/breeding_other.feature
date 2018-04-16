Feature: Breeding Pets

  Background:
    Given I have started an application
    And I am answering the breeding other step of the you and your family form
    
  Scenario: Yes redirects correctly
    And I fill in the 'application_breeding_other' field
    Then I should be on the 'referees' step

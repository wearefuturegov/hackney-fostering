Feature: Logging in
  
  Background:
    Given I am a confirmed user
    
  Scenario: Login when I haven't started the full application
    And I login
    Then I should be on the 'welcome' step
    
  Scenario: Continue where I left off
    And I login
    And I am answering the adults living at home step of the you and your family form
    And I logout and login again
    Then I should be on the 'adults_living_at_home' step

    
    

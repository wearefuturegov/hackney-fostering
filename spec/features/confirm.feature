Feature: Confirm account and start application

  Background:
    Given there is a user who wants to apply
    And I go to the confirmation link
  
  Scenario: Setting password successfully
    And I set a valid password
    Then I should be on the 'welcome' step
    
  Scenario: Password missing
    And I don't set a password
    Then I should see an error telling me to provide a password
    
  Scenario: Passwords don't match
    And I set non-matching passwords
    Then I should see an error telling me the passwords don't match
    
  Scenario: Password already set
    And I set a valid password
    And I go to the confirmation link
    Then I should be on the 'welcome' step

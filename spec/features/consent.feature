@javascript
Feature: Consent

  Background:
    Given I have completed an application
    And I am logged in
    And I go to the application consent page
    
  Scenario: Consenting sends an email to the fostering team
    And I consent and sign the form
    Then the fostering team should recieve an application email
  
  Scenario: Consenting sends an email to me
    And I consent and sign the form
    Then I should recieve a confirmation email
  
  Scenario: Not checking the boxes shows an error
    And I consent without checking the boxes
    Then I should see the correct error messages

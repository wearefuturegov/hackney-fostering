Feature: Consent

  Background:
    Given I have completed an application
    And I go to the application consent page
    
  Scenario: Consenting sends an email
    And I consent and sign the form
    Then the fostering team should recieve an application email

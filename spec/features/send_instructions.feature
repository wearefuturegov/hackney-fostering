Feature: Send instructions

  Background:
    Given there is a user who wants to apply
  
  Scenario: Send instructions to start application
    And I go to the send instructions link
    Then the user should recieve an email with instructions on how to access their application

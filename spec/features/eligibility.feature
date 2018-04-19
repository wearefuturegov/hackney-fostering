Feature: Eligibility

  Background:
    Given I have started an application

  Scenario: Intial enquiry form
    And I complete the form
    Then I should see 'Thank you for providing your details'
    And my application should be stored
  
  Scenario: Sending an email
    And I complete the form
    Then the fostering team should recieve an eligible email

  Scenario: Creating a user
    And I complete the form
    Then a user should be generated
  
  Scenario: Sending an email when ineligible
    And I complete the form and am ineligible
    Then the fostering team should recieve an ineligible email

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
  
  Scenario: Email address should be unique
    And there is an applicant with my email
    And I complete the form
    Then I should see an error telling me the email is already used

  Scenario: Creating a user
    And I complete the form
    Then a user should be generated
  
  Scenario: Sending an email when ineligible
    And I complete the form and am ineligible
    Then the fostering team should recieve an ineligible email

Feature: Eligibility

  Scenario: Intial enquiry form
    When I complete the form
    Then I should see 'Thank you for providing your details'
    And my application should be stored
  
  Scenario: Sending an email
    When I complete the form
    Then the fostering team should recieve an eligible email

  Scenario: Sending an email with phone number
    When I complete the form with a phone number
    Then the fostering team should recieve an eligible email
  
  Scenario: Email address should be unique
    Given there is an applicant with my email
    When I complete the form
    Then I should see an error telling me the email is already used

  Scenario: Creating a user
    When I complete the form
    Then a user should be generated
  
  Scenario: Sending an email when ineligible
    When I complete the form and am ineligible
    Then the fostering team should recieve an ineligible email

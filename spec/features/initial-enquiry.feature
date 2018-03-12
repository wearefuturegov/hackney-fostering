Feature: Initial enquiry

  Scenario: Intial enquiry form
    Given I have started an application
    And I complete the form
    Then I should see 'Thank you for providing your details'
    And my application should be stored
    

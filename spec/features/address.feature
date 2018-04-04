@javascript
Feature: Entering an address

  Background:
    Given I have started an application
    And I am answering the full address step of the you and your family form
  
  Scenario: Entering an address
    And I fill in my address and a moved in date
    Then my address should be saved in the database
  
  Scenario: Postcode does not exist
    And I fill in a postcode that does not exist
    Then I should see 'Postcode is not recognised, please try again.'
  
  Scenario: Enter address manually
    And I fill in my address and a moved in date manually
    Then my address should be saved in the database

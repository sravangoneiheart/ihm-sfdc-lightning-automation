Feature: Salesforce side testing -SF: Account - SF: permission set for local

  @regression @ID86369 @salesforce_side_testing @light1
  Scenario: Salesforce side testing  -_SF: permission set for local
    Given the user navigates to the Salesforce website
    And the user logs into Salesforce as a smoke ae user
    And the user views the page
    And the user click the accounts tab
    And the application navigates to the salesforce accounts page
    And the user click the new button
    And the user views the page
    And the user presses the arrow_down keyboard key
    And the user clicks the next button
    And the user views the page
    And the user views the page
    And the user fills in "Automate the test application using data" for account name search
    And the user views the page
    And the user clicks the more button
    And the user views the page
    And the user presses the tab keyboard key
    And the user presses the enter keyboard key
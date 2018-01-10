Feature: Salesforce side testing -SF: Account - SF: permission set for local

  @regression @ID86369 @salesforce_side_testing @light11
  Scenario: Salesforce side testing  -_SF: permission set for local
    Given the user navigates to the Salesforce website
    And the user logs into Salesforce as a smoke ae user
    And the user views the page
    And the user clicks the leads tab local
    Given the application navigates to the Salesforce leads page
    And the user clicks the new lead
    And the user views the page
    And the user fills the salesforce leads page with new leads advertiser data
    And the user views the page
    And the user scroll down the page

#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#
##    And the user presses the tab key for 17 times
#    And the user presses the enter keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the enter keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the enter keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the enter keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the enter keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the enter keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the tab keyboard key
#    And the user presses the enter keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the arrow_down keyboard key
#    And the user presses the enter keyboard key
#    And the user clicks the save button


#    And the user fills in "Call in" for lead source
#    And the user fills in "Other" for lead source type


#    And the user fills in "iheart" for last name








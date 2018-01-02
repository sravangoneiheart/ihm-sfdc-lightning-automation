Feature: Verify the understanding of each step definition in Page Steps

  Scenario: The user navigates to the SBD website
    Given the user navigates to the SBD website

  Scenario: The user is signed into the SBD website as <data_key>
    Given the user is signed into the SBD website as test

  Scenario: The user closes the popup window
    Given the user closes the popup window

  Scenario: The application navigates to/remains on the Product Registration page
    Given the application navigates to the Product Registration page
    And the application remains on the Home page

  Scenario: The user clicks the <page_element>
    Given the user clicks the sign up button

  Scenario: Take a screenshot
    Given take a screenshot

  Scenario: A new browser window opens
    Given a new browser window opens

  Scenario: The user confirms/cancels on the alert box
    Given the user confirms on the alert box
    And the user cancels on the alert box

  Scenario: File Upload Example
    Given the user is signed into the SBD website as test
    And the user clicks hi username
    And the user clicks the edit profile link
    And the application navigates to the my profile page
    And the user clicks the update profile photo link
    And the application navigates to the my profile update photo page
    When the user clicks the update photo link
    Then the user uploads the file for windows
    And the user clicks the update photo button


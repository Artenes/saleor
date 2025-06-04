Feature: User profile management
  As a registered user
  I want to maintain my profile
  So that my account information is accurate

  @TC041
  Scenario: View profile
    Given I am logged in
    When I navigate to my profile page
    Then I should see my account details

  @TC042
  Scenario: Update profile information
    Given I am on my profile page
    When I edit my personal information
    And I save the changes
    Then my profile should show the updated information

  @TC043
  Scenario: Change password
    Given I am on my profile page
    When I change my password
    Then I should be able to log in with the new password

  @TC044
  Scenario: Delete account
    Given I am on my profile page
    When I choose to delete my account
    Then I should be asked to confirm the deletion
    And my account should be removed after confirmation

  # Additional negative and boundary scenarios
  @TC045
  Scenario: View profile while not logged in
    Given I am not logged in
    When I navigate to my profile page
    Then I should be redirected to the login page

  @TC046
  Scenario: Update profile with invalid email
    Given I am on my profile page
    When I enter an invalid email address
    And I attempt to save the changes
    Then I should see an error indicating the email is invalid

  @TC047
  Scenario: Change password with mismatched confirmation
    Given I am on my profile page
    When I enter a new password and a different confirmation
    Then the password should not be changed
    And I should be warned that the confirmation does not match

  @TC048
  Scenario: Delete account with wrong confirmation
    Given I am on my profile page
    When I request account deletion but provide the wrong confirmation data
    Then my account should remain active

  @TC104
  Scenario: Enable two-factor authentication
    Given I am on my profile page
    When I enable two-factor authentication
    Then my account should require a verification code on next login

  @TC105
  Scenario: Link a social media account
    Given I am on my profile page
    When I connect my social media account
    Then it should appear as a linked login option

  @TC106
  Scenario: Upload oversized profile picture
    Given I am on my profile page
    When I upload a profile picture that exceeds the allowed size
    Then I should see an error indicating the file is too large

  @TC107
  Scenario: Reactivate account after deletion request
    Given I previously requested account deletion within the grace period
    When I log in again
    Then my account should be reactivated and my data restored

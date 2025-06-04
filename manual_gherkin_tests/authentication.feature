Feature: User authentication
  As a user of the storefront
  I want to securely authenticate
  So that I can access protected features

  @TC001
  Scenario: Successful login
    Given I am on the login page
    When I enter valid credentials
    And I submit the form
    Then I should be logged in
    And I should see my dashboard

  @TC002
  Scenario: Login with invalid credentials
    Given I am on the login page
    When I enter an invalid username or password
    And I submit the form
    Then I should see an authentication error
    And I should remain on the login page

  @TC003
  Scenario: Logout
    Given I am logged in
    When I choose to log out
    Then I should be logged out
    And I should see the home page

  @TC004
  Scenario: Request password reset
    Given I am on the login page
    When I request a password reset
    And I provide my email address
    Then I should receive reset instructions by email

  @TC005
  Scenario: Reset password with token
    Given I have received a password reset email
    When I follow the reset link
    And I enter a new password
    Then my password should be updated
    And I should be able to log in with the new password

  # Additional black box scenarios
  @TC006
  Scenario: Login with empty credentials
    Given I am on the login page
    When I submit the form without entering a username or password
    Then I should see validation errors for missing credentials

  @TC007
  Scenario: Login after multiple failed attempts
    Given I have failed to log in several times
    When I try again with valid credentials
    Then my account should be locked and I should see a lockout message

  @TC008
  Scenario: Reset password with expired token
    Given I have an expired password reset link
    When I attempt to set a new password
    Then I should be informed that the token is invalid or expired

  @TC009
  Scenario: Login when account is disabled
    Given my account has been disabled by an administrator
    When I attempt to log in with valid credentials
    Then I should see a message that my account is inactive

  @TC010
  Scenario: Session timeout after inactivity
    Given I am logged in
    And I remain inactive for a prolonged period
    When I interact with the site again
    Then I should be asked to log in once more

  @TC085
  Scenario: Login attempt with SQL injection
    Given I am on the login page
    When I enter a username containing SQL commands
    And I submit the form
    Then I should see an authentication error
    And no database information should be exposed

  @TC086
  Scenario: Login requiring two-factor authentication
    Given my account requires two-factor authentication
    When I log in with valid credentials
    Then I should be prompted for a second authentication factor

  @TC087
  Scenario: Change password with weak password
    Given I am on the change password page
    When I enter a new password that does not meet complexity requirements
    Then I should see a message describing the password rules
    And my password should remain unchanged

  @TC088
  Scenario: Log out from all devices
    Given I am logged in on multiple devices
    When I choose to log out from all devices
    Then all active sessions should be terminated
    And I should return to the login page

  @TC089
  Scenario: Password reset request rate limit
    Given I have already requested several password resets recently
    When I request another password reset
    Then I should be informed that I must wait before requesting again

Feature: Error handling and edge cases
  As an API consumer
  I want meaningful feedback when requests fail
  So that I can resolve issues

  @TC059
  Scenario: Unauthorized access
    Given I am not authenticated
    When I attempt to access a protected resource
    Then I should be redirected to the login page

  @TC060
  Scenario: Invalid data submission
    Given I am submitting a form
    When I provide invalid or missing data
    Then I should see validation messages explaining the problem

  @TC061
  Scenario: Server error
    Given the server encounters an unexpected condition
    When I perform an action
    Then I should see a generic error message
    And the action should not be completed

  # Additional negative scenarios for robustness
  @TC062
  Scenario: Accessing an invalid API endpoint
    Given I send a request to a non-existent API route
    Then I should receive a 404 not found response

  @TC063
  Scenario: Exceeding rate limit
    Given the API has a rate limit
    When I send requests rapidly beyond the allowed threshold
    Then I should receive a rate limit exceeded error

  @TC064
  Scenario: Concurrent modification conflict
    Given two administrators edit the same product simultaneously
    When they both submit their changes
    Then one should receive a conflict notification to retry

  @TC113
  Scenario: Service unavailable during maintenance
    Given the API is in maintenance mode
    When I send a request
    Then I should receive a 503 service unavailable response

  @TC114
  Scenario: Malformed JSON request body
    Given I send a request with invalid JSON syntax
    Then I should receive a 400 bad request error

  @TC115
  Scenario: Request exceeds maximum payload size
    Given the API enforces a payload size limit
    When I send a request larger than the limit
    Then I should receive a 413 payload too large error

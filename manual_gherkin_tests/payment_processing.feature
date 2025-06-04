Feature: Payment processing
  As a shopper
  I want reliable payment options
  So that I can securely complete purchases

  @TC077
  Scenario: Pay with valid credit card
    Given I am on the checkout page
    When I submit valid credit card details
    Then the payment should be authorized
    And the order should be created

  @TC078
  Scenario: Payment fails due to insufficient funds
    Given I am on the checkout page
    When I submit a card with insufficient funds
    Then I should see a payment declined message
    And the order should remain pending

  @TC079
  Scenario: Cancel payment during processing
    Given I start the payment process
    When I cancel before completion
    Then no charge should occur and I should return to the checkout page

  @TC080
  Scenario: Request refund for paid order
    Given my order was paid successfully
    When I request a refund
    Then the payment should be reversed and I should be notified

  @TC125
  Scenario: Pay using PayPal
    Given I am on the checkout page
    When I choose PayPal as my payment method
    Then I should be redirected to PayPal to complete the payment
    And the order should be created after successful payment

  @TC126
  Scenario: Partially capture a pre-authorized payment
    Given a payment has been pre-authorized for my order
    When the store captures only part of the amount
    Then the remaining authorized amount should be voided

  @TC127
  Scenario: Retry payment with a different card
    Given my payment attempt was declined
    When I submit a different valid card
    Then the payment should be processed successfully

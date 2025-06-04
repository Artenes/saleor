Feature: Order management
  As a customer
  I want to review and manage my orders
  So that I can track purchases

  @TC033
  Scenario: View past orders
    Given I am logged in
    When I navigate to my orders page
    Then I should see a list of my previous orders

  @TC034
  Scenario: View order details
    Given I have past orders
    When I select an order from the list
    Then I should see the order details including status and items

  @TC035
  Scenario: Cancel order before fulfillment
    Given I have an order that has not shipped yet
    When I request cancellation
    Then the order should be canceled
    And I should receive a cancellation confirmation

  @TC036
  Scenario: Attempt to cancel fulfilled order
    Given my order has already shipped
    When I attempt to cancel it
    Then I should be informed that cancellation is not possible

  # Additional state transitions and negative scenarios
  @TC037
  Scenario: View order details for another user
    Given I am logged in
    When I attempt to view the details of an order belonging to a different user
    Then I should see an authorization error

  @TC038
  Scenario: Return items from delivered order
    Given my order status is delivered
    When I initiate a return request
    Then the order should enter the return requested state

  @TC039
  Scenario: Refund order after cancellation
    Given my order has been canceled
    When I request a refund
    Then the refund should be processed and I should receive confirmation

  @TC040
  Scenario: Order history pagination boundary
    Given I have many past orders
    When I navigate to a non-existent page of my order history
    Then I should see the last available page of orders

  @TC100
  Scenario: Change shipping method before fulfillment
    Given my order is awaiting fulfillment
    When I update the shipping method
    Then the order should reflect the new shipping method

  @TC101
  Scenario: Add tracking information to order
    Given my order has shipped
    When the store enters tracking information
    Then I should be able to view tracking details on the order page

  @TC102
  Scenario: Reorder previous items
    Given I am viewing my past orders
    When I choose to reorder an order
    Then the items should be added to my cart for checkout

  @TC103
  Scenario: View downloadable invoice
    Given I have completed an order
    When I view the order details
    Then I should be able to download a PDF invoice

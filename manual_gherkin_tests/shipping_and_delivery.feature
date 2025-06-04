Feature: Shipping and delivery
  As a shopper
  I want to manage shipping for my orders
  So that my purchases arrive at the correct address

  @TC073
  Scenario: Select shipping method during checkout
    Given I have items ready for checkout
    When I choose a shipping option
    Then the shipping cost should be added to my total

  @TC074
  Scenario: Enter shipping address from unsupported country
    Given I am entering a shipping address
    When I specify a country that the store does not ship to
    Then I should see a message that shipping is unavailable

  @TC075
  Scenario: Update shipping address after order placed
    Given my order is awaiting fulfillment
    When I change the shipping address
    Then the new address should be saved and used for delivery

  @TC076
  Scenario: Track shipment status
    Given my order has been shipped
    When I view the order details page
    Then I should see the latest shipment tracking information

  @TC122
  Scenario: Calculate shipping for oversized item
    Given my cart contains an oversized product
    When I view shipping options
    Then I should see an additional surcharge for oversized shipping

  @TC123
  Scenario: Prevent shipping to PO box
    Given the carrier does not deliver to PO boxes
    When I enter a PO box as my shipping address
    Then I should be asked to provide a valid street address

  @TC124
  Scenario: Notify user when shipment is delayed
    Given my order shipment is delayed beyond the estimated delivery date
    When I check the order status
    Then I should see a notification about the delay

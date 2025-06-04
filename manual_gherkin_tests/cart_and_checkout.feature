Feature: Cart and checkout
  As a shopper
  I want to manage my cart and place orders
  So that I can purchase products

  @TC021
  Scenario: Add product to cart
    Given I am viewing a product detail page
    When I add the product to the cart
    Then the cart count should increase

  @TC022
  Scenario: Update quantity in cart
    Given I have a product in the cart
    When I change the quantity
    Then the cart total should update accordingly

  @TC023
  Scenario: Remove product from cart
    Given I have a product in the cart
    When I remove the product
    Then it should no longer appear in the cart

  @TC024
  Scenario: Begin checkout
    Given I have products in the cart
    When I proceed to checkout
    Then I should be prompted for shipping and billing information

  @TC025
  Scenario: Complete checkout with valid payment
    Given I am on the checkout page with products in the cart
    When I provide valid shipping, billing, and payment details
    And I confirm the purchase
    Then the order should be created
    And I should see an order confirmation

  @TC026
  Scenario: Checkout with invalid payment
    Given I am on the checkout page with products in the cart
    When I provide invalid payment information
    Then I should see a payment error
    And the order should not be created

  # Additional boundary and negative scenarios
  @TC027
  Scenario: Add product with zero quantity
    Given I am viewing a product detail page
    When I attempt to add zero quantity to the cart
    Then I should see a message that quantity must be at least one

  @TC028
  Scenario: Update cart quantity beyond available stock
    Given a product has limited stock
    When I set the cart quantity higher than the available stock
    Then I should see a warning that the requested quantity is unavailable
    And the quantity should be limited to the maximum available

  @TC029
  Scenario: Remove product from empty cart
    Given my cart is empty
    When I attempt to remove a product
    Then I should see a message that the cart is already empty

  @TC030
  Scenario: Begin checkout with empty cart
    Given I have no items in my cart
    When I attempt to proceed to checkout
    Then I should be prevented from continuing until items are added

  @TC031
  Scenario: Checkout with expired payment method
    Given I am on the checkout page with products in the cart
    When I enter payment information for an expired card
    Then I should see a message that the payment method is invalid
    And the order should remain pending

  @TC032
  Scenario: Session expires during checkout
    Given I have been on the checkout page for an extended time
    When I submit my order
    Then I should be redirected to log in again before the order is processed

  @TC095
  Scenario: Add same product multiple times
    Given I am viewing a product detail page
    When I add the product to the cart multiple times
    Then the quantity in my cart should increase accordingly

  @TC096
  Scenario: Guest checkout without creating account
    Given I have items in my cart
    When I proceed to checkout without logging in
    Then I should be able to complete the purchase as a guest

  @TC097
  Scenario: Partial checkout due to stock issue
    Given one item in my cart has limited stock
    When I attempt to place the order
    Then I should be informed that only some items are available
    And I should be able to proceed with the available quantity

  @TC098
  Scenario: Edit cart after selecting shipping method
    Given I selected a shipping method during checkout
    When I return to the cart and change quantities
    Then the shipping cost should be recalculated when I revisit checkout

  @TC099
  Scenario: Save cart for later
    Given I have items in my cart
    When I choose to save my cart for later
    Then the cart contents should persist for my next visit

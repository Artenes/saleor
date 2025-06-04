Feature: Discounts and voucher codes
  As a shopper
  I want to redeem promotional discounts
  So that I can save money on purchases

  @TC065
  Scenario: Apply valid discount code
    Given I have items in my cart
    When I enter a valid discount code
    Then the cart total should decrease accordingly

  @TC066
  Scenario: Apply invalid or expired discount code
    Given I have items in my cart
    When I enter an invalid or expired discount code
    Then I should see a message that the code is not valid
    And the cart total should remain unchanged

  @TC067
  Scenario: Remove applied discount code
    Given a discount code is applied to my cart
    When I remove the discount code
    Then the cart total should return to the original amount

  @TC068
  Scenario: Apply discount exceeding order total
    Given I have items in my cart
    When I apply a discount greater than the order total
    Then the order total should not be negative
    And I should see any remaining balance voided

  @TC116
  Scenario: Stack multiple discount codes
    Given I have items in my cart
    When I apply two different valid discount codes
    Then the discounts should be combined according to store policy

  @TC117
  Scenario: Apply voucher to ineligible products
    Given my cart contains items that do not qualify for the voucher
    When I apply the voucher code
    Then I should be informed which items are not eligible
    And only eligible items should receive a discount

  @TC118
  Scenario: Remove discount after checkout started
    Given a discount code is applied to my cart
    And I have begun the checkout process
    When I remove the discount code
    Then the order total should update without the discount

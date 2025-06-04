Feature: Gift card management
  As a shopper
  I want to purchase and redeem gift cards
  So that I can give them to others or pay for my orders

  @TC069
  Scenario: Purchase a gift card
    Given I am viewing gift card options
    When I buy a gift card with a chosen value
    Then I should receive a confirmation with the gift card code

  @TC070
  Scenario: Redeem gift card at checkout
    Given I have a valid gift card code
    When I apply it during checkout
    Then the order total should be reduced by the gift card balance

  @TC071
  Scenario: Redeem expired or used gift card
    Given the gift card has already been used or is expired
    When I attempt to redeem the code
    Then I should see a message that the gift card is not valid
    And the order total should remain unchanged

  @TC072
  Scenario: Check remaining gift card balance
    Given I partially used a gift card
    When I view my gift card balance
    Then I should see the remaining amount available for future use

  @TC119
  Scenario: Partially redeem gift card across multiple orders
    Given I have a gift card with a remaining balance
    When I use it on a new order costing less than the balance
    Then the remaining balance should update accordingly

  @TC120
  Scenario: Transfer gift card to another user
    Given I own a gift card
    When I transfer it to another registered user
    Then the other user should be able to redeem the gift card
    And it should no longer be usable by me

  @TC121
  Scenario: Redeem gift card with invalid characters
    Given I have an alphanumeric gift card code
    When I enter the code with unsupported characters or spaces
    Then I should see an error that the code format is invalid

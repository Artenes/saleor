Feature: Administration tasks
  As an administrator
  I want to manage the catalog and orders
  So that the store remains up to date

  @TC049
  Scenario: Add a new product
    Given I am logged in as an administrator
    When I create a new product with valid data
    Then the product should be listed in the catalog

  @TC050
  Scenario: Edit existing product
    Given a product exists in the catalog
    When I modify its details as an administrator
    Then the changes should be saved

  @TC051
  Scenario: Delete a product
    Given a product is no longer available
    When I remove it from the catalog
    Then it should not appear in search results

  @TC052
  Scenario: Update stock levels
    Given I am managing inventory
    When I adjust the quantity of a product
    Then the new stock level should be reflected in the store

  @TC053
  Scenario: Review orders
    Given customers have placed orders
    When I view the order management page
    Then I should see all pending and fulfilled orders

  # Additional negative scenarios
  @TC054
  Scenario: Add product with missing required fields
    Given I am logged in as an administrator
    When I attempt to create a product without a name or price
    Then the product should not be saved and validation errors should display

  @TC055
  Scenario: Edit product with invalid price
    Given a product exists in the catalog
    When I change its price to a negative value
    Then I should see a validation error and the update should not be saved

  @TC056
  Scenario: Delete product that is part of an active order
    Given the product is included in an unfulfilled order
    When I attempt to delete the product from the catalog
    Then I should be prevented from deleting it

  @TC057
  Scenario: Update stock with negative quantity
    Given I am managing inventory
    When I set a product's stock to a negative number
    Then I should see an error and the stock level should remain unchanged

  @TC058
  Scenario: Unauthorized user attempts admin access
    Given I am logged in as a regular user
    When I try to visit the admin dashboard
    Then I should receive an authorization error

  @TC108
  Scenario: Bulk upload products via CSV
    Given I am logged in as an administrator
    When I upload a valid CSV file of products
    Then all products in the file should be created in the catalog

  @TC109
  Scenario: View audit log of changes
    Given I am logged in as an administrator
    When I open the audit log
    Then I should see records of recent administrative actions

  @TC110
  Scenario: Assign staff roles
    Given another user account exists
    When I assign staff privileges to that user
    Then the user should have access to the admin dashboard

  @TC111
  Scenario: Mark order as fulfilled
    Given a customer order is ready for shipment
    When I mark the order as fulfilled
    Then the customer should receive a notification of shipment

  @TC112
  Scenario: Generate sales report
    Given there are completed orders in the system
    When I generate a sales report for the last month
    Then the report should include totals for revenue and number of orders

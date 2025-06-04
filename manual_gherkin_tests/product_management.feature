Feature: Product browsing and search
  As a shopper
  I want to explore products
  So that I can find items of interest

  @TC011
  Scenario: View product list
    Given I navigate to the products page
    Then I should see a list of available products

  @TC012
  Scenario: Filter products by category
    Given I am on the products page
    When I select a specific category
    Then only products belonging to that category should be displayed

  @TC013
  Scenario: Search products
    Given I am on the products page
    When I search for a product by keyword
    Then only products matching the keyword should be displayed

  @TC014
  Scenario: View product details
    Given I am on the products page
    When I select a product
    Then I should see detailed information including price and description

  @TC015
  Scenario: Pagination of product list
    Given the product list contains more items than fit on one page
    When I navigate to the next page
    Then I should see additional products

  # Additional edge cases and negative scenarios
  @TC016
  Scenario: Search with unsupported characters
    Given I am on the products page
    When I search for a product using special characters
    Then I should see a message that no results were found

  @TC017
  Scenario: Filter by non-existent category
    Given I am on the products page
    When I filter by a category that does not exist
    Then I should see an empty product list

  @TC018
  Scenario: Pagination beyond last page
    Given there are fewer pages than requested
    When I navigate to a page number greater than the last page
    Then I should remain on the last available page

  @TC019
  Scenario: Pagination with page zero
    Given I enter page number zero in the pagination controls
    Then I should be redirected to the first page of results

  @TC020
  Scenario: Search with blank keyword
    Given I am on the products page
    When I perform a search with no keyword
    Then all products should be displayed

  @TC090
  Scenario: Sort products by price ascending
    Given I am on the products page
    When I sort by price from low to high
    Then products should appear in ascending price order

  @TC091
  Scenario: Sort products by rating
    Given products have customer ratings
    When I sort by highest rating
    Then the best rated products should appear first

  @TC092
  Scenario: View out-of-stock product details
    Given a product is out of stock
    When I view its details
    Then I should see that it is unavailable
    And I should not be able to add it to my cart

  @TC093
  Scenario: Search product by SKU
    Given I am on the products page
    When I search using a product SKU
    Then the product matching that SKU should be displayed

  @TC094
  Scenario: Filter by price range boundary
    Given I set a minimum and maximum price range
    When I apply the filter
    Then only products priced within that range should be shown

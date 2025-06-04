# Manual Gherkin Test Suite

This directory contains manual Gherkin scenarios for core API features of the Saleor storefront. Each feature is assigned an identifier to assist with traceability.

The suite now includes over 100 test scenarios covering positive and negative edge cases.
## Feature IDs

| Feature ID | Feature Name | Description |
| ---------- | ------------ | ----------- |
| F01 | Authentication | Login, logout and password management flows |
| F02 | Product Browsing and Search | Viewing and filtering products |
| F03 | Cart and Checkout | Managing the shopping cart and completing purchases |
| F04 | Order Management | Viewing, canceling and returning orders |
| F05 | User Profile Management | Managing account details and credentials |
| F06 | Administration Tasks | Catalog and order administration |
| F07 | Error Handling and Feedback | Handling invalid requests and server errors |
| F08 | Discounts and Voucher Codes | Applying promotional codes during checkout |
| F09 | Gift Card Management | Buying and redeeming gift cards |
| F10 | Shipping and Delivery | Choosing shipping options and tracking orders |
| F11 | Payment Processing | Completing and refunding payments |
| F12 | Digital Product Downloads | Accessing files purchased online |

Each scenario in the `.feature` files is tagged with a test case ID (`TC###`). The [traceability_matrix.csv](traceability_matrix.csv) maps every test case to its corresponding feature.

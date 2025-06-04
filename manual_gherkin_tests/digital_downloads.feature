Feature: Digital product downloads
  As a customer purchasing digital goods
  I want immediate access to my files
  So that I can use them right away

  @TC081
  Scenario: Purchase digital product
    Given I complete checkout for a digital product
    Then I should receive a secure download link
    And the link should allow me to download the file

  @TC082
  Scenario: Download link expires
    Given I wait until the download link expires
    When I attempt to download the file
    Then I should be informed that the link is no longer valid

  @TC083
  Scenario: Access download after logging in
    Given I purchased a digital product
    When I log in and visit my orders page
    Then I should be able to download the file again if the link is still valid

  @TC084
  Scenario: Attempt download without purchase
    Given I have not purchased the digital product
    When I try to access the download link
    Then I should be denied access

  @TC128
  Scenario: Download limit reached
    Given the store limits the number of download attempts
    And I have already downloaded the file the maximum number of times
    When I try to download again
    Then I should be informed that the limit has been reached

  @TC129
  Scenario: Verify checksum of downloaded file
    Given I download a digital product
    When I compare its checksum to the expected value
    Then the checksums should match

  @TC130
  Scenario: Pause and resume large download
    Given I am downloading a large digital product
    When I pause and later resume the download
    Then the download should continue from where it left off

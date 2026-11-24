Feature: View an item

  @SC-1 @UC-1.1
  Scenario: The owner views their item
    Given a signed-in user who owns item "A"
    When they open item "A"
    Then they see item "A" with all its fields

  @SC-2 @UC-1.1a
  Scenario: Another user's item is hidden
    Given a signed-in user who does not own item "B"
    When they open item "B"
    Then they see "not found"

Feature: Viewing the list of categories and their sub-categories

  Scenario: Listing all main categories and their sub-categories
    Given there are main categories with sub-categories
    When I visit the categories page
    Then I see the list of all categories
    And  I see the list of all sub-categories for each main category

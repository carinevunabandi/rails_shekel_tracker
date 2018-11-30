Feature: Viewing the list of categories and their sub-categories

  Background:
    Given there are main categories with sub-categories
    When I visit the categories page

  Scenario: Viewing all main categories and their sub-categories
    Then I see the list of all categories
    And  I see the list of all sub-categories for each main category

    @javascript
  Scenario: Adding a new category with no sub-categories
    When I click the create new category button
    And I enter in the name and the description of the new category
    And I enter in the name of any sub-categories for the new category
    And I click save
    Then the new category and any sub-categories should be created
    Then the category and all its sub-categories should be listed on the page

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
    And I click save
    Then the new category should be created
    Then the category should be listed on the page
    And I see a flash success message

  @javascript
  Scenario: Adding a new category with sub-categories
    When I click the create new category button
    And I enter in the name and the description of the new category
    And I enter in the name of any sub-categories for the new category
    And I click save
    Then the new category should be created
    And  the sub-categories should be created
    Then the category should be listed on the page
    And  all its sub-categories should be listed on the page
    And I see a flash success message

  @javascript
  Scenario: Adding a category already existing
    Given there is a Groceries expense category in the database
    When I click the create new category button
    And I enter Groceries as the name of the new category
    And I click save
    Then no other duplicate category should be created
    And I see a flash error message

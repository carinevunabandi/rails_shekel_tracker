Feature: Viewing the current expenses list

  Background:
    Given there are expenses for the current time period
    When I view the current expenses list


    @wip
  Scenario: Listing all current expenses
    Then I see all expenses for the current time period

    @wip
  Scenario: Viewing details about current expenses
    Then I see the expense's occurence date
    Then I see the expense's description
    Then I see the expense's main category
    Then I see the expense's sub category
    Then I see the expense's amount
    Then I see the expense's payment method

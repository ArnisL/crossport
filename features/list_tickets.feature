Feature: List tickets
  As a customer
  I want to see my tickets listed
  So that I know I've been helped

  Background:
    Given I am an authenticated customer

  Scenario: Empty list
    Then I should see 'You have no tickets'

  Scenario: Full list
    Given I have following tickets:
      | title  | status |
      | test   | open   |
      | test1  | open   |
    And additional 10 random tickets
    And I open portal
    Then I should see following tickets in table:
      | # | Title  | Status |
      | 1 | test   | open   |
      | 2 | test1  | open   |
    And I should not see 'You have no tickets'

  Scenario: List pagination
    Given I have 10 random tickets
    And I have following tickets:
      | title    | description    |
      | eleventh | #1 on 2nd page |
      | twelfth  | #2 on 2nd page |
    And I open portal
    And I press '2'
    Then I should see following tickets in table:
      | #  | Title    |
      | 11 | eleventh |
      | 12 | twelfth  |

Feature: Lists tickets
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
      | 1 | test   | Open   |
      | 2 | test1  | Open   |
    And I should not see 'You have no tickets'
    And I should see '12' in tickets_total

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

  Scenario: Search
    Given I have following tickets:
      | title           | description  |
      | find this       | lorem ipsum  |
      | move along      | move along   |
      | foobar          | find this    |

    When I search tickets by 'find this'
    Then I should see following tickets in table:
      | # | Title     |
      | 1 | find this |
      | 2 | foobar    |
    And I should see '2' in tickets_total

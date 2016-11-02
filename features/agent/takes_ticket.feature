Feature: Takes ticket
  As a support agent
  I want to take ticket
  So that I could help customer

  Background:
    Given there is an open ticket
    And I am authenticated support agent

  Scenario:
    When I press 'Take'
    Then I should see following tickets in table:
      | #  | Status      |
      | 1  | In progress |


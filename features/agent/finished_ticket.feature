Feature: Finishes ticket
  As a support agent
  I want to finish taken ticket
  So that customer knows he has been helped

  Background:
    Given there is an open ticket
    And I am authenticated support agent
    And I press 'Take'

  Scenario:
    When I press 'Finish'
    Then I should see following tickets in table:
      | #  | Status      |
      | 1  | Finished |

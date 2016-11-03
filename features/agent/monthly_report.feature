Feature: Monthly report
  As a support agent
  I want to generate report
  So that I can see closed tickets monthly

  Scenario:
    Given there is a closed ticket
    And I am authenticated support agent
    When I press 'Monthly report'
    Then I should receive pdf file
    And pdf file should contain 1 ticket

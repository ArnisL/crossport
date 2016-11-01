Feature: List tickets
  As a customer
  I want to see my tickets listed
  So that I know I've been helped

  Background:
    Given I am an authenticated customer

  Scenario: Empty list
    Then I should see 'You have no tickets'


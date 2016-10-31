Feature: Open ticket
  As a user
  I want to open ticket
  So that I can get help from support agents

  Background:
    Given I am an authenticated user

  Scenario: Successful ticket opening
    When I press 'Open ticket'
    Then I should see new_ticket page

    When I fill in 'Title' with 'unable to dual-boot windows and linux'
    And I fill in 'Description' with 
      """
      forgot to backup boot partition, formatted it

      installed linux, unable to repair windows BCD
      """
    And I press 'Open ticket'
    Then I should see notification 'Ticket successfully opened!'
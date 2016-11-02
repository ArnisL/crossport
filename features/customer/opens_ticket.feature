Feature: Opens ticket
  As a customer
  I want to open ticket
  So that I can get help from support agents

  Scenario: Denied for unauthenticated users
    Given I open new_ticket page
    Then I should see notification 'You are not authorized to perform this action.'
    Then I should see new_user_session page

  Scenario: Successful ticket opening
    Given I am an authenticated customer
    And I press 'Open ticket'

    Then I should see new_ticket page

    When I fill in 'Title' with 'unable to dual-boot windows and linux'
    And I fill in 'Description' with 
      """
      forgot to backup boot partition, formatted it

      installed linux, unable to repair windows BCD
      """
    And I press 'Open'
    Then I should see notification 'Ticket successfully opened!'

  Scenario: Unsuccessful ticket opening
    Given I am an authenticated customer
    And I press 'Open ticket'

    When I press 'Open'
    And I should see error "can't be blank" on 'Title' field
    And I should see error "can't be blank" on 'Description' field

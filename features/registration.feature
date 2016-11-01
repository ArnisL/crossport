Feature: Registration
  As a visitor
  I want to sign up
  So that I can open support tickets

  Background:
    Given I open portal

  Scenario: Portal asks user to login
    Then I should see new_user_session page

  Scenario: Successful user registration
    When I press 'Sign up'
    When I fill in 'Email' with 'arnis.lapsa@gmail.com'
    And I fill in 'Password' with '123123'
    And I fill in 'Password confirmation' with '123123'
    And I press 'Sign up'
    Then I should see root page

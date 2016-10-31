Feature: Registration
  As a visitor
  I want to sign up
  So that I can open support tickets

  Background:
    Given I open portal

  Scenario: Portal asks to register user
    Then I should see new_user_registration page

  Scenario: User registration
    When I fill in 'Email' with 'arnis.lapsa@gmail.com'
    And I fill in 'Password' with '123123'
    And I fill in 'Password confirmation' with '123123'
    And I click 'Sign up' button
    Then I should see root page

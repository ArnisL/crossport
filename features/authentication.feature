Feature: Authentication
  As a visitor
  I want to sign up
  So that I can open support tickets

  Background:
    Given I open portal

  Scenario: Portal asks visitor to login
    Then I should see new_user_session page

  Scenario: Sign in
    Given I have customer with email 'arnis.lapsa@gmail.com' and password '123123'
    When I fill in 'Email' with 'arnis.lapsa@gmail.com'
    And I fill in 'Password' with '123123'
    And I press 'Sign in'
    Then I should see root page
    And I should see notification 'Signed in successfully.'

  Scenario: Unsuccessful Sign in
    When I press 'Sign in'
    Then I should see notification 'Invalid Email or password'

  Scenario: Registration
    When I press 'Sign up'
    When I fill in 'Email' with 'arnis.lapsa@gmail.com'
    And I fill in 'Password' with '123123'
    And I fill in 'Password confirmation' with '123123'
    And I press 'Sign up'
    Then I should see root page
    And I should see notification 'Welcome! You have signed up successfully.'

  Scenario: Sign out
    Given I am an authenticated customer
    When I press 'Sign out'
    Then I should see new_user_session page
    And I should see notification 'Signed out successfully.'

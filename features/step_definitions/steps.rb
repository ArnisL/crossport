Given /^I have user with email '([^\"]*)' and password '([^\"]*)'$/ do |email, password|
  @user = User.create email: email,
    password: password,
    password_confirmation: password
end

Given /^I am an authenticated user$/ do
  email = 'arnis.lapsa@gmail.com'
  password = '123123'

  step "I have user with email '#{email}' and password '#{password}'"
  step "I open new_user_session page"
  step "I fill in 'Email' with '#{email}'"
  step "I fill in 'Password' with '#{password}'"
  step "I press 'Sign in'"
end

When /^I open portal$/ do
  visit root_path
end

When /^I open (.*) page$/ do |name|
  visit send "#{name}_path" 
end

When /^I fill in '(.*)' with '(.*)'$/ do |input, value|
  fill_in input, with: value
end

When /^I fill in '(.*)' with$/ do |input, value|
  fill_in input, with: value
end

When /^I press '(.*)'$/ do |button|
  click_on(button)
end

Then /^I should see (.*) page$/ do |name|
  expect(page.current_path).to eq send "#{name}_path"
end

Then /^I should see notification 'Ticket successfully opened!'$/ do
  pending # Write code here that turns the phrase above into concrete actions
end

Given /^I have customer with email '([^\"]*)' and password '([^\"]*)'$/ do |email, password|
  @user = FactoryGirl.create :user,
    email: email,
    password: password,
    password_confirmation: password
end

Given /^I am an authenticated customer$/ do
  step "I have customer with email 'arnis.lapsa@gmail.com' and password '123123'"
  step "I open new_user_session page"
  step "I fill in 'Email' with 'arnis.lapsa@gmail.com'"
  step "I fill in 'Password' with '123123'"
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

Then /^I should see notification '(.*)'$/ do |notification|
  expect(page).to have_css '.alert', text: notification
end

Then(/^I should see error "([^"]*)" on '(.*)' field$/) do |error, field|
  expect(find_field(field).find('+span.help-block').text).to eq error
end

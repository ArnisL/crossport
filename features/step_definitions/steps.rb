Given /^I have user with email '([^\"]*)' and password '([^\"]*)' roled as (.*)$/ do |email, password, role|
  @current_user = FactoryGirl.create :user,
    email: email,
    password: password,
    password_confirmation: password,
    role: role
end

Given /^I am an authenticated customer$/ do
  step "I have user with email 'arnis.lapsa@gmail.com' and password '123123' roled as customer"
  step "I open new_user_session page"
  step "I fill in 'Email' with 'arnis.lapsa@gmail.com'"
  step "I fill in 'Password' with '123123'"
  step "I press 'Sign in'"
end

Given /^I have following tickets:$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:ticket, hash.merge(user: @current_user))
  end
end

Given(/^I have (\d+) random tickets$/) do |times|
  FactoryGirl.create_list(:ticket, times.to_i, user: @current_user)
end

Given(/^additional (\d+) random tickets$/) do |times|
  step "I have #{times} random tickets"
end

Given(/^I am authenticated support agent$/) do
  step "I have user with email 'arnis.lapsa@gmail.com' and password '123123' roled as agent"
  step "I open new_user_session page"
  step "I fill in 'Email' with 'arnis.lapsa@gmail.com'"
  step "I fill in 'Password' with '123123'"
  step "I press 'Sign in'"
end

Given(/^there is an open ticket$/) do
  FactoryGirl.create :ticket, status: :open, user: FactoryGirl.create(:user)
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

Then(/^I should see '(.*)'$/) do |text|
  expect(page).to have_content text
end

Then(/^I should see '(.*)' in (.*)$/) do |text, container|
  expect(page).to have_css "##{container}", text: text
end

Then(/^I should not see '(.*)'$/) do |text|
  expect(page).to_not have_content text
end

Then(/^I should see following (.*) in table:$/) do |table_id, table|
  table.hashes.each do |hash|
    row = find_all("##{table_id} tbody tr").select do |row|
      row.find_all('td')[0].text == hash['#']
    end[0]

    hash.values.each do |value|
      expect(row).to have_content value
    end
  end
end

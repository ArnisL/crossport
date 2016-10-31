When(/^I open portal$/) do
  visit root_path
end

Then(/^I should see (.*) page$/) do |name|
  expect(page.current_path).to eq send "#{name}_path"
end

When(/^I fill in '(.*)' with '(.*)'$/) do |input, value|
  fill_in input, with: value
end

When(/^I click '(.*)' button$/) do |button|
  click_on(button)
end

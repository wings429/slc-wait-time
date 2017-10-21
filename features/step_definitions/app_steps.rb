require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /the following student queues exist/ do |student_queues_table|
  student_queues_table.hashes.each do |student_queue|
    StudentQueue.create student_queue
  end
end

Given /^I am logged in as a tutor$/ do
  pending
end

Given /^I am on the student line page$/ do
  pending
end

Then /^I should see a list of students$/ do
  pending
end

When /^I edit student "(.*)"$/ do |word|
  pending
end



When /^I fill in "(.*)" and "(.*)" times with "(.*)" and "(.*)"$/ do |word|
  pending
end

Then /^I should see "start" filled with "0" and end filled with "0"$/ do |word|
  pending
end

Given /^there are no students$/ do |word|
  pending
end

Given /^a student is on the home page$/ do
  pending
end

Given /^the student clicks sign in$/ do
  pending
end

Given /^I am on the wait time page$/ do
  pending
end

Then /^I should be on the sign up form$/ do
  pending
end

Then /^I should not be on the sign up form$/ do
  pending
end

When /^I fill out information$/ do
  pending
end

When /^I click on "(.*)"$/ do |word|
  pending
end

Given /^I am on the sign up form$/ do
  pending
end

Then /^I should see a wait time$/ do
  pending
end

Given /^I am on (.*)$/ do |page_name|
  visit path_to(page_name)
end

When /^I fill in the "(.*)" form and click "(.*)"$/ do |form_type, button|
  
  text_fields = ["student_last_name", "student_first_name", "student_sid", "student_email", "student_course"]
  text_inputs = ["brown", "bob", "12345678", "bobb@berkeley.edu", "english"]
  radio_fields = ["request_type_appointment"]
  
  for i in 0..(text_fields.length-1)
    text_field = text_fields[i]
    text_input = text_inputs[i]
    steps %Q{
      When I fill in "#{text_field}" with "#{text_input}"
    }
  end

  for i in 0..(radio_fields.length-1)
    radio_button = radio_fields[i]
    steps %Q{
      When I click "#{radio_button}"
    }
  end
  steps %Q{
      When I press "Submit"
  }



end

Then /^I should see a wait time of "(.*)"$/ do |wait_time|
  step %{I should see "#{wait_time}"}
end

Then /^(?:|I )should not be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should != path_to(page_name)
  else
    assert_not_equal path_to(page_name), current_path
  end
end
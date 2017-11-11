
Given /^"(.*)" "(.*)" is on the wait time page$/ do |first_name, last_name|
  sid = 123456
  steps %Q{
    Given I am on the home page
    Then I fill in "student_first_name" with "#{first_name}"
    And I fill in "student_last_name" with "#{last_name}"
    And I fill in "student_sid" with "#{sid}"
    And I click on "form_submit"
    Then I should be on the wait time page for "#{first_name}" "#{last_name}"
  }
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Given /^"(.*)" "(.*)" is already in line$/ do |first_name, last_name|
  steps %Q{
    Given "#{first_name}" "#{last_name}" is on the wait time page
    And she clicks on "YES"
    Given "#{first_name}" "#{last_name}" is on the wait time page
  }
end

Then /^"(.*)" "(.*)" should( not)? be in line$/ do |first_name, last_name, not_be_in_line|
  student_list = Student.where(:first_name => first_name, :last_name => last_name)
  student_list.should_not be_empty
  student = student_list[0]
  if not_be_in_line
    expect(student.student_queues.find(student.sid).status).to eq("canceled")
  else
    expect(student.student_queues.find(student.sid).status).to eq("waiting")
  end
end

And /^(?:she|he?) clicks on "(.*)"$/ do |button|
  steps %Q{ When follow "#{button}"}
end

Given /^I specify "(.*)"$/ do |string|
  pending
end

Given /^"(.*)" "(.*)" is signed up for all three appointments$/ do |string, string2|
  pending
end

When /^"(.*)" "(.*)" signs up for all three appointments again$/ do |string, string2|
  pending
end

Then /^I should see my name on tutor for "(.*)" "(.*)" with id "(.*)" under "(.*)"$/ do |last_name, first_name, id, table|
  pending
end

Then /^The tutors should see "(.*)" appointments for "(.*)" "(.*)"$/ do |num_app, last_name, first_name|
  pending
end

Then /^I should see "(.*)" filled with "(.*)" and "(.*)" filled with "(.*)"$/ do |arg1, arg2, arg3, arg4|
  pending
end

Then /^I should see the history for that day$/ do
  pending
end

Given /^I see one day\'s worth of history$/ do
  pending
end

When /^I click "(.*)" on "(.*)"$/ do |arg1, arg2|
  pending
end

When /^I select "(.*)" from "(.*)"$/ do |arg1, arg2|
  pending
end
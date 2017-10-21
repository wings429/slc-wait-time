Feature: estimated wait time for help
  
  As a busy student
  So that I can decide whether to wait in line or not
  I want to know my estimated wait time
  
Background: student requests in database
 
  Given the following student queues exist:
  | student_id | waiting? |
  | 25804240   | true     |
  | 00000000   | false    |
  | 25804241   | true     |
  | 25804242   | true     |  

Scenario: students signs up for “drop-in”
  Given I am on the sign up page
  When I fill in the "student_requests" form and click "Submit"
  Then I should see a wait time of "30 min"

Scenario: student visits wait time page
  Given I am on the wait time page for 4
  Then I should see a wait time of "90 min"
  
#student email confirmation should have abiltiy to cancel I think


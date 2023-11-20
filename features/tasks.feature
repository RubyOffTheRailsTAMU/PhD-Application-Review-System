Feature: Filter Application Reviews
  As a user
  I want to filter application reviews by their status
  So that I can easily find the applications I am looking for
  
  Background: users in database
    Given the following users exist:
      | user_netid   | user_name | user_level | user_email        | password  |
      | 12345        | admin     | admin      | admin@tamu.edu    | admin     |
    
    Given the following reviews exist:
      | review_id | user_netid | applicant_id | review_info    | rating | status      | gar   | gat   |
      | 1         | 12345      | app1         | Good progress  | 4      | In Progress | true  | false |
      | 2         | 12345      | app2         | Needs work     | 3      | In Progress | false | true  |
      | 3         | 12345      | app3         | Well done      | 5      | Assigned    | true  | false |


    Scenario: User filters the applications by 'Assigned' status
        When I am on the log in page
        And I want to log into the site with "Username" as "admin" and "Password" as "admin"
        And I click "Log In"
        And I follow link "/tasks"
        And I check the "Assigned" checkbox
        And I check the "In Progress" checkbox
        And I check the "Completed" checkbox

        
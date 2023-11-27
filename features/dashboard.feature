Feature: Open Dashboard Page
  As a user with committee_chair user role
  I want to be able to open Dashboard Page
  So that I can use the assign applications functionality
  
  Background: users in database
    Given the following users exist:
      | user_netid   | user_name | user_level       | user_email        | password  |
      | 12345        | admin     | committee_chair  | admin@tamu.edu    | admin     |
      | 12346        | admin     | committee_member | admin@tamu.edu    | admin     |
    
    Given the following reviews exist:
      | review_id | user_netid | applicant_id | review_info    | rating | status      | gar   | gat   |
      | 1         | 12346      | app1         | Good progress  | 4      | In Progress | true  | false |
      | 2         | 12346      | app2         | Needs work     | 3      | In Progress | false | true  |
      | 3         | 12346      | app3         | Well done      | 5      | Assigned    | true  | false |

    Scenario: User clicks on the dashboard tab on the navbar
        When I am on the log in page
        And I want to log into the site with "Username" as "admin" and "Password" as "admin"
        And I click "Log In"
        And I follow link "/dashboards/show"

        
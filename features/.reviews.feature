@allreviews

Feature: Add a review
  
  Background: users in database
    Given the following users exist:
      | user_netid   | user_name | user_level      | user_email        | password  |
      | 123456789    | John      | faculty         | johnwick@tamu.edu | babayaga  |
      | 987654321    | SubZero   | committee_chair | subzero@tamu.edu  | igotice   |
      | 12345        | admin     | admin           | admin@tamu.edu    | admin     |

    Scenario: User can add a review
        Given I have an applicants query: '123'
        When I am on the log in page
        And I want to log into the site with "Username" as "admin" and "Password" as "admin"
        And I click "Log In"
        When I search the applicant field "cas_id"
        And I select the first checkbox
        And I select "John" from the dropdown
        And I click "Submit"
        And I follow link "applicant?cas_id=1123288204"
        And I fill in review "Good" with rating "4" and assistantship "GAT"
        And I click "Submit Review"

    Scenario: User can update a review
        Given I have an applicants query: '123'
        When I am on the log in page
        And I want to log into the site with "Username" as "admin" and "Password" as "admin"
        And I click "Log In"
        When I search the applicant field "cas_id"
        And I follow link "applicant?cas_id=1123288204"
        And I fill in review "Very Good" with rating "4" and assistantship "GAT"
        And I click "Save For Later"
        And I fill in review "Very Good" with rating "5" and assistantship "GAT"
        And I click "Save For Later"
        And I click "Submit Review"

    Scenario: User can assign a review
        Given I have an applicants query: '123'
        When I am on the log in page
        And I want to log into the site with "Username" as "John" and "Password" as "babayaga"
        And I click "Log In"
        And I follow link "/users/new"
        And I create a user with netid "123" username "John W"
        And I click "Create User"
        And I follow link "/home"
        When I search the applicant field "cas_id"
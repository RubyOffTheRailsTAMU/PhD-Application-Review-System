@allreviews

Feature: Add a review
  
  Background: users in database
    Given the following users exist:
      | user_netid   | user_name | user_level | user_email        | password  |
      | 12345        | admin     | admin      | admin@tamu.edu    | admin     |

    Scenario: User can add a review
        Given I have an applicants query: '123'
        When I am on the log in page
        And I want to log into the site with "Username" as "admin" and "Password" as "admin"
        And I click "Log In"
        When I search the applicant field "cas_id"
        And I follow link "application?cas_id=1123288204"
        And I fill in review "Good" with rating "4" and assistantship "GAT"
        And I click "Submit"
        Then I should see "Review was successfully created."

    Scenario: User can update a review
        Given I have an applicants query: '123'
        When I am on the log in page
        And I want to log into the site with "Username" as "admin" and "Password" as "admin"
        And I click "Log In"
        When I search the applicant field "cas_id"
        And I follow link "application?cas_id=1123288204"
        And I fill in review "Very Good" with rating "4" and assistantship "GAT"
        And I click "Save For Later"
        And I fill in review "Very Good" with rating "5" and assistantship "GAT"
        And I click "Save For Later"
        And I click "Submit"
        Then I should see "Review was successfully updated."

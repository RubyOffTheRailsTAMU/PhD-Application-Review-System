@search
  Feature: Search for an applicant
  
  Background: users in database
    Given the following users exist:
      | user_netid   | user_name | user_level | user_email        | password  |
      | 12345        | admin     | admin      | admin@tamu.edu    | admin     |

    Scenario: Successfully search the applicant
      Given I have applicants name: 'Evan'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant by sending a GET request to database
      Then I should see "Evan"

    Scenario: Applicant does not exist
      Given I have applicants name: 'abc'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant by sending a GET request to database
      Then I should see "No results found."

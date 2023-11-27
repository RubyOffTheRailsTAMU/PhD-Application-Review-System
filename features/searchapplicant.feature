@search
  Feature: Search for an applicant
  
  Background: users in database
    Given the following users exist:
      | user_netid   | user_name | user_level | user_email        | password  |
      | 12345        | admin     | admin      | admin@tamu.edu    | admin     |

    Scenario: Successfully search the applicant
      Given I have an applicants query: '*last_name~evan'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant field "last_name"
      Then I should see "Evan"

    Scenario: Applicant does not exist
      Given I have an applicants query: '*last_name~abc'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant field "last_name"
      Then I should see "Total Results: 0"

    Scenario: Successfully search the applicant
      Given I have an applicants query: '*gender=Male citizenship_country_name=Bangladesh'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant field "last_name"
      Then I should see "Evan"
      And I follow link "applicant?cas_id=4040926943.0"
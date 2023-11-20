@search
  Feature: Search for an applicant
  
  Background: users in database
    Given the following users exist:
      | user_netid   | user_name | user_level | user_email        | password  |
      | 12345        | admin     | admin      | admin@tamu.edu    | admin     |

    Scenario: Successfully search the applicant
      Given I have an applicants query: 'Evan'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant field "name"
      Then I should see "Evan"

    Scenario: Applicant does not exist
      Given I have an applicants query: 'abc'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant field "name"
      Then I should see "Total Results: 0"

    Scenario: Successfully search the applicant
      Given I have an applicants query: '*application_gender=Male application_citizenship_country=Bangladesh'
      When I am on the log in page
      And I want to log into the site with "Username" as "admin" and "Password" as "admin"
      And I click "Log In"
      When I search the applicant field "name"
      Then I should see "Evan"
      And I follow link "applicant?cas_id=4040926943"
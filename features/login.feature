@login


Feature: Login to the Application

Background: users in database
  Given the following users exist:
    | user_netid   | user_name | user_level | user_email        | password  |
    | 12345        | admin     | admin      | admin@tamu.edu    | admin     |

  Scenario: Cannot access home when not logged in
    When I follow link "/home"
    Then I should see "Login with Google"

  Scenario: Good user log in with Google
    When I am on the log in page
    When I want to log into the site with email "johnwick@tamu.edu" using Google
    And I follow link "/users/new"
    And I create a user with netid "123" username "John W"
    And I click "Create User"
    Then I should be able to log in
    And I should see "John W"

  Given the following users exist:
    | user_netid   | user_name | user_level | user_email        | password  |
    | 123456789    | John      | faculty    | johnwick@tamu.edu | babayaga  |
    | 987          | admin     | admin      | admin@tamu.edu    | admin     |

  Scenario: Admin Successful log in
    When I am on the log in page
    And I want to log into the site with "Username" as "admin" and "Password" as "admin"
    And I click "Log In"
    Then I should be able to log in

  Scenario: Admin Unsuccessful log in
    When I am on the log in page
    And I want to log into the site with "Username" as "John" and "Password" as "babayaga"
    And I click "Log In"
    Then I should not be able to log in


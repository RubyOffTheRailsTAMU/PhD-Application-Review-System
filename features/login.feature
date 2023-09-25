@login
Feature: Login to the Application with TAMU Google account
  Scenario: Good user not logged in
    Given I am a user
    When I want to log into the site with email "abc@tamu.edu"
    Then I should be able to log in

  Scenario: Bad user not logged in
    Given I am a user
    When I want to log into the site with email "abc@gmail.com"
    Then I should not be able to log in
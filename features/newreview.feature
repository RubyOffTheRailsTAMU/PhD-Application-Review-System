@newreview

Feature: User can now add a new review
    Scenario: User succeed to add a review
        Given I am on the reviews page
        When I click "New review"
        And I fill in "Text" with "This is a test review"
        And I click "Create Review"
        Then I should see "Review was successfully created."
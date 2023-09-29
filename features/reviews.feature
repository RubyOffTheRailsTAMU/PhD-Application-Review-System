@allreviews

Feature: User can view all candidates on the page
    Scenario: User can view all candidates on the page
        When I want to see all reviews
        Then The response status should be 200
        And I can see all reviews
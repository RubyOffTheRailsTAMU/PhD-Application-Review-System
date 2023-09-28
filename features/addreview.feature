@addreview
  Feature: Add reviews to the application

    Scenario: Successfully add reviews to the application
      When I send a POST request to ""
      Then Then the response status should be 200
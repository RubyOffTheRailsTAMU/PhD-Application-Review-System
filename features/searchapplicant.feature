@search
  Feature: Search for an applicant
    Scenario: Successfully search the applicant
      Given I have applicant's name: ""
      When I search the applicant by sending a GET request to ""
      Then the response status should be 200
      And The result is valid

    Scenario:
      Given I have applicant's name: ""
      When I search the applicant by sending a GET request to ""
      # TODO: responce code
      Then the response status should be 404

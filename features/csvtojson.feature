@csvtojson
Feature: Testing the xlsx/tojson API

  Scenario: Converting xlsx to JSON
    When I send a GET request to "http://127.0.0.1:3000/xlsx/tojson"
    # Then the response status should be 200
    And the response should be a valid JSON


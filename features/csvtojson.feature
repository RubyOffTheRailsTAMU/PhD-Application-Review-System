Feature: CSV to JSON Conversion

  Scenario: Convert CSV to JSON
    Given I have a CSV file named "example.csv" in the "root" directory
    When I send a GET request to "/xlsx/tojson"
    Then the response should be a valid JSON document
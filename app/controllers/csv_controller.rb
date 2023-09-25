require 'csv'
require 'json'


class CsvController < ApplicationController
  def tojson
    # Replace 'path_to_your_csv_file.csv' with the actual path to your CSV file.
    csv_file = File.read('path_to_your_csv_file.csv')

    # Parse the CSV data into an array of hashes.
    csv_data = CSV.parse(csv_file, headers: true)

    # Convert the array of hashes to JSON.
    json_data = csv_data.map(&:to_h).to_json

    # Respond with JSON data.
    render json: json_data
  end
end

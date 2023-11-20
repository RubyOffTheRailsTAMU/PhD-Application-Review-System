# frozen_string_literal: true

class SearchService
  require "net/http"

  def self.search(query:, field:, token:)
    # uri = URI("https://phdapplicationsystemdatabase-5e5fc255409c.herokuapp.com/api/v1/searches?query=#{query}&field=#{field}")
    uri = URI("http://127.0.0.1:3001/api/v1/searches?query=#{query}&field=#{field}")
    puts uri
    # http = Net::HTTP.new(uri.host, uri.port)

    # request = Net::HTTP::Get.new(uri)
    # request['Authorization'] = "Bearer #{token}"

    # response = http.request(request)
    # JSON.parse(response.body)

    # response = Net::HTTP.get(uri)
    headers = {
      "Authorization" => "Bearer #{token}",
    }

    response = Net::HTTP.get_response(uri, headers)
    puts response.body
    JSON.parse(response.body)
  end
  def self.get_all_field_names(token:)
    uri = URI("http://127.0.0.1:3001/api/v1/field_names")
    headers = { "Authorization" => "Bearer #{token}" }

    response = Net::HTTP.get_response(uri, headers)
    puts "Response Body: #{response.body}"  # Debugging line

    if response.is_a?(Net::HTTPSuccess)
      fields_data = JSON.parse(response.body)
      field_names = fields_data.map { |field| field["field_alias"] }
      field_names
    else
      puts "Error with the API call: #{response.code}"  # Error handling
      []
    end
  end
end

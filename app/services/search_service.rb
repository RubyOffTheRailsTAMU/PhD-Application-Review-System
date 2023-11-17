# frozen_string_literal: true

class SearchService
  require 'net/http'
  def self.searchall(token:)
    puts "token in service #{token}"
    uri = URI(ENV['DATABASE_SERVER_URL'] + '/api/v1/allapplicants')
    headers = {
      'Authorization' => "Bearer #{token}"
    }
    response = Net::HTTP.get_response(uri, headers)
    JSON.parse(response.body)
    # uri = URI("http://
  end

  def self.search(query:, field:, token:)
    uri = URI(ENV['DATABASE_SERVER_URL'] + "/api/v1/searches?query=#{query}&field=#{field}")
    # uri = URI("http://127.0.0.1:3001/api/v1/searches?query=#{query}&field=#{field}")
    puts uri
    # http = Net::HTTP.new(uri.host, uri.port)

    # request = Net::HTTP::Get.new(uri)
    # request['Authorization'] = "Bearer #{token}"

    # response = http.request(request)
    # JSON.parse(response.body)

    # response = Net::HTTP.get(uri)
    headers = {
      'Authorization' => "Bearer #{token}"
    }

    response = Net::HTTP.get_response(uri, headers)
    puts response.body
    JSON.parse(response.body)
  end
end

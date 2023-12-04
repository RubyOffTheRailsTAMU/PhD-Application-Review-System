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
    puts uri
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
      "Authorization" => "Bearer #{token}",
    }

    response = Net::HTTP.get_response(uri, headers)
    puts "here"
    puts response.body
    begin
      JSON.parse(response.body)
    rescue JSON::ParserError => e
      JSON.parse("{}")
    end
  end
  def self.get_all_field_names(token:)
    uri = URI(ENV["DATABASE_SERVER_URL"]+"/api/v1/field_names")
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
  def self.get_pdf(token:, cas_id:)
    # remove deciman from cas_id
    cas_id_i = cas_id.to_i
    uri = URI(ENV["DATABASE_SERVER_URL"]+"/api/v1/return_pdf?cas_id=#{cas_id_i}")
    headers = { "Authorization" => "Bearer #{token}" }

    response = Net::HTTP.get_response(uri, headers)
    puts "Response Body: #{response.body}"  # Debugging line

    if response.is_a?(Net::HTTPSuccess)
      pdf_data = JSON.parse(response.body)
      # Convert the base64 string to a PDF
      pdf = Base64.decode64(pdf_data["pdf_file"])
      # if pdf_data["pdf_file"] is not a string
      if pdf_data["pdf_file"] == "error"
        # write an empty pdf to a file
        File.open("public/#{cas_id}.pdf", 'wb') do |f|
          return "No PDF found"
        end
      end
      # write the PDF to a file
      File.open("public/#{cas_id}.pdf", 'wb') do |f|
        f.write(pdf)
        return "#{cas_id}"
      end
    else
      puts "Error with the API call: #{response.code}"  # Error handling
      []
    end
  end
end

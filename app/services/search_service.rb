class SearchService
    require 'net/http'
  
    def self.search(query:, field: ,token:)
        uri = URI("https://phdapplicationsystemdatabase-5e5fc255409c.herokuapp.com/api/v1/searches?query=#{query}&field=#{field}")
        # uri = URI("http://127.0.0.1:3001/api/v1/searches?query=#{query}&field=#{field}")
        http = Net::HTTP.new(uri.host, uri.port)

        request = Net::HTTP::Get.new(uri)
        request['Authorization'] = "Bearer #{token}" 

        response = http.request(request)
        JSON.parse(response.body)
    end
end
  
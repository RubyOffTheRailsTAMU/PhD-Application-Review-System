class SearchService
    require 'net/http'
  
    def self.search(query:, field:)
        uri = URI("https://phdapplicationsystemdatabase-5e5fc255409c.herokuapp.com/api/v1/searches?query=#{query}&field=#{field}")
        #uri = URI("http://127.0.0.1:3001/api/v1/searches?query=#{query}&field=#{field}")
        response = Net::HTTP.get(uri)
        JSON.parse(response)
    end
  end
  
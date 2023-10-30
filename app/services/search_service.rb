class SearchService
    require 'net/http'
  
    def self.search(query:, field: ,token:)
        uri = URI("https://phdapplicationsystemdatabase-5e5fc255409c.herokuapp.com/api/v1/searches?query=#{query}&field=#{field}")
        # uri = URI("http://127.0.0.1:3001/api/v1/searches?query=#{query}&field=#{field}")
        puts uri
        # http = Net::HTTP.new(uri.host, uri.port)

        # request = Net::HTTP::Get.new(uri)
        # request['Authorization'] = "Bearer eyJhbGciOiJSUzI1NiJ9.eyJ1c2VyX2VtYWlsIjoieHJmQHRhbXUuZWR1In0.lWL_Zvobkt9y-noCBrvJxmlOjwtqngCr4AtFBbCB6PtCdEVQS7vlGpVuNk5AoNypYN4fcmxh5XT4aovCYZZ8OdaRrjJQEqMSc7SySNgK6c-XKWjTapbAQYGqLWgbJ0o-YiW8WzgExBSvb0h-rXPf8muI_XdGx7gFOZ1JNiCIt3Rs26y9KiAtaHJnYmFeBRI4r4-qQwXKdfCyv-jb3LUD26hXUfAbW38YKxDRxBteRo8PJDCYCMZ_eOc1OxS0nkwZfrY7_XcuInvXARAYOE36STO94sqNivO5gEyLpDkFIqK78TKhmHUioqfK6SM-G3I47u7xF4PMPPY0NbE6nXK8bg" 

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
  
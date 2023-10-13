class SearchesController < ApplicationController
    require 'net/http'
  
    def index
      if params[:query].present?
        #todo: non local
        uri = URI("http://localhost:3001/api/v1/searches?query=#{params[:query]}")
        response = Net::HTTP.get(uri)
        @results = JSON.parse(response)
      else
        @results = []
      end
    end
  end
  
class SearchesController < ApplicationController
    require 'net/http'
  
    def index
      if params[:query].present?
        query = params[:query]
        field = params[:field]
        #todo: non local
        uri = URI("https://phdapplicationsystemdatabase-5e5fc255409c.herokuapp.com/api/v1/searches?query=#{params[:query]}&field=#{params[:field]}")
        response = Net::HTTP.get(uri)
        @results = JSON.parse(response)
      else
        @results = []
      end
    end
  end
  
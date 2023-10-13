class SearchesController < ApplicationController
    require 'net/http'
    before_action :require_user
    def index
      if params[:query].present?
        query = params[:query]
        field = params[:field]
        #todo: non local
        uri = URI("http://localhost:3001/api/v1/searches?query=#{params[:query]}&field=#{params[:field]}")
        response = Net::HTTP.get(uri)
        @results = JSON.parse(response)
      else
        @results = []
      end
    end
  end
  
class SearchesController < ApplicationController
    require 'net/http'
    before_action :require_user

    def index
      if params[:query].present?
        @results = SearchService.search(query: params[:query], field: params[:field], token: session[:jwt_token])
      else
        @results = []
      end
    end
  end

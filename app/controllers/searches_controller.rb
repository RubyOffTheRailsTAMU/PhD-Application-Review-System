class SearchesController < ApplicationController
    require 'net/http'
    before_action :require_user
    protect_from_forgery with: :null_session
    def index
      @phd_app_url = ENV["PHD_APP_REVIEW_URL"]
      if params[:query].present?
        @results = SearchService.search(query: params[:query], field: params[:field], token: session[:jwt_token])
      else
        @results = []
      end
    end
  end

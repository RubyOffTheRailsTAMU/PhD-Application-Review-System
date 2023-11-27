# frozen_string_literal: true

class SearchesController < ApplicationController
    require 'net/http'
    before_action :require_user
    skip_before_action :verify_authenticity_token
    def index
      @phd_app_url = ENV["PHD_APP_REVIEW_URL"]
      if params[:query].present?
        @results = SearchService.search(query: params[:query], field: params[:field], token: session[:jwt_token])
      else
        @results = []
      end
    end
  end

# frozen_string_literal: true

class SearchesController < ApplicationController
  require "net/http"
  before_action :require_user

  def index
    @results = if params[:query].present?
        SearchService.search(query: params[:query], field: params[:field], token: session[:jwt_token])
      else
        []
      end
  end

  # In SearchesController
  def field_names
    token = request.headers["Authorization"].to_s.split(" ").last
    field_names = SearchService.get_all_field_names(token: token)
    render json: field_names
  end
end

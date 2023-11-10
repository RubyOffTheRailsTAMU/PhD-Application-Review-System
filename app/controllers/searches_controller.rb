# frozen_string_literal: true

class SearchesController < ApplicationController
  require 'net/http'
  before_action :require_user

  def index
    @results = if params[:query].present?
                 SearchService.search(query: params[:query], field: params[:field], token: session[:jwt_token])
               else
                 []
               end
  end
end

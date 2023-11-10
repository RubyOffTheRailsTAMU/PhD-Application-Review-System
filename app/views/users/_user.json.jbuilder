# frozen_string_literal: true

json.extract! user, :id, :user_netid, :user_name, :user_level, :created_at, :updated_at
json.url user_url(user, format: :json)

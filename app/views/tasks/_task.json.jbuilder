# frozen_string_literal: true

json.extract! task, :id, :status, :user_id, :applicant_id, :created_at, :updated_at
json.url task_url(task, format: :json)

json.extract! review, :id, :user_netid, :candidate_id, :review_info, :review_id, :created_at, :updated_at
json.url review_url(review, format: :json)

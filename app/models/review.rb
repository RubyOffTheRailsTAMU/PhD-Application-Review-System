class Review < ApplicationRecord
    belongs_to :appuser, foreign_key: 'appuser_netid', class_name: 'AppUser'
end

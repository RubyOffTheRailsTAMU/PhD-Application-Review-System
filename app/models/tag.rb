# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :user
  validates :cas_id, presence: true
end

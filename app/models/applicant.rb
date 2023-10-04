class Applicant < ApplicationRecord
  has_one :toefl
  has_one :gre
end

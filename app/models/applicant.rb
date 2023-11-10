class Applicant < ApplicationRecord
  #todo: probably get rid of the sub tables?
  has_one :toefl
  has_one :gre
  has_one :application_ielt
  has_many :schools
end

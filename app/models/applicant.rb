# frozen_string_literal: true

class Applicant < ApplicationRecord
  # TODO: probably get rid of the sub tables?
  has_one :toefl
  has_one :gre
  has_one :application_ielt
  has_many :schools
end

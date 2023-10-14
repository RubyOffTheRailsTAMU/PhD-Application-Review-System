class Task < ApplicationRecord
  belongs_to :user
  belongs_to :applicant  # Ensure this association is defined

  enum status: { assigned: 0, inprogress: 1, completed: 2 }

  after_initialize :set_default_status, if: :new_record?

  validates :status, presence: true

  private

  def set_default_status
    self.status ||= :assigned
  end
end
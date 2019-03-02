class Attending < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :role, presence: true, inclusion: { in: %w(host attendee),
                                                message: "%{value} is not a valid role" }
end

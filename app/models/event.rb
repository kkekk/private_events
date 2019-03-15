class Event < ApplicationRecord
  has_many :attendings, dependent: :destroy
  has_many :users, through: :attendings

  validates :name, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true

  def hosts
    attendings.where(role: 'host').map(&:user)
  end

  def attendees
    attendings.where(role: 'attendee').map(&:user)
  end
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendings, dependent: :destroy
  has_many :events, through: :attendings

  def hostings
    attendings.where(role: 'host')
  end

  def attendees
    attendings.where(role: 'attendee')
  end
end

class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendee, through: :attendees_events

  validates :date, :location, presence: true
end

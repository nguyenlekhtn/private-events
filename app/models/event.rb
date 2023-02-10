class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances
  has_many :attendees, through: :attendances

  validates :date, :location, :name, presence: true

  def self.past_events
    where("date < ?", Date.current)
  end

  def self.upcoming_events
    where("date >= ?", Date.current)
  end
end

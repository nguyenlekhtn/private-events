class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances
  has_many :attendees, through: :attendances

  validates :date, :location, :name, presence: true

  scope :past, -> { where('date < ?', Date.current) }
  scope :upcoming, -> { where('date >= ?', Date.current) }
end

class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances
  has_many :attendees, through: :attendances

  validates :date, :location, presence: true

  def name
    "Event #{id} at #{location}, hosted by #{creator.username}"
  end
end

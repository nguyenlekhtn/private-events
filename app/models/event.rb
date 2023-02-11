class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances

  validates :date, :location, :name, presence: true

  scope :past, -> { where('date < ?', Date.current) }
  scope :upcoming, -> { where('date >= ?', Date.current) }

  def happened?
    date < Date.current
  end

  def not_happended?
    !happened?
  end
end

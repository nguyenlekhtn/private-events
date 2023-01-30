class Event < ApplicationRecord
  belongs_to :creator, class_name: "Users"

  validates :date, :location, presence: true
end

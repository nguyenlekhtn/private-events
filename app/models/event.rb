class Event < ApplicationRecord
  belongs_to :creator, class_name: "Users"
end

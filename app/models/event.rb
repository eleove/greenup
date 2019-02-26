class Event < ApplicationRecord
  belongs_to :location
  has_many :event_participants, dependent: :destroy
  validates :name, presence: true
  validates :schedule, presence: true
end

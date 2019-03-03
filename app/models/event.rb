class Event < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :event_participants, dependent: :destroy
  has_many :users, through: :event_participants
  # validates :name, presence: true
  validates :schedule, presence: true
  validates :location, presence: true, uniqueness: true
end

class Location < ApplicationRecord
  belongs_to :user
  has_many :location_photos, dependent: :destroy
  has_one :event, dependent: :destroy
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end

class Location < ApplicationRecord
  belongs_to :user
  has_many :location_photos, dependent: :destroy
  has_many :events, dependent: :destroy
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end

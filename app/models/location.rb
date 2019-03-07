class Location < ApplicationRecord
  belongs_to :user
  has_one :event, dependent: :destroy
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
end

class Location < ApplicationRecord
  GARBAGE = ['Verre', 'Emballage et plastique', 'Textile', 'Ordures ménagères', 'Métal', 'Déchets industriels', 'Électroménager']

  belongs_to :user
  has_one :event, dependent: :destroy
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  mount_uploader :photo, PhotoUploader
  # validates :photo, presence: true
end


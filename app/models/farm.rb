class Farm < ApplicationRecord
  has_many :harvests

  validates :name, :address, :size, :latitude, :longitude, presence: true
end

class Farm < ApplicationRecord
  validates :name, :address, :size, :latitude, :longitude, presence: true
end

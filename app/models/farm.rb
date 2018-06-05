# frozen_string_literal: true

class Farm < ApplicationRecord
  has_many :harvests, dependent: :destroy

  validates :name, :address, :size, :latitude, :longitude, presence: true
end

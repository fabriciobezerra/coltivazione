# frozen_string_literal: true

class Farm < ApplicationRecord
  validates :name, :address, :size, :latitude, :longitude, presence: true

  belongs_to :user
  has_many :harvests, dependent: :nullify

  def active_harvest
    harvests.where(state: 'active').last
  end
end

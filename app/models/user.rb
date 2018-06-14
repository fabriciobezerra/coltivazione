# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :farms, dependent: :destroy
  has_many :harvests, dependent: :destroy
end

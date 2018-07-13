# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :farms, dependent: :nullify
  has_many :harvests, dependent: :nullify
  has_many :events, dependent: :nullify
end

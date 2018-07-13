# frozen_string_literal: true

class Event < ApplicationRecord
  validates :text, :date, presence: true

  belongs_to :harvest
  belongs_to :user
end

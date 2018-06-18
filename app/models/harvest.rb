# frozen_string_literal: true

class Harvest < ApplicationRecord
  validates :seed, :initial_date, :state,
            :end_date_prediction, :employee, presence: true

  belongs_to :farm
  belongs_to :user

  enum state: %i[active cancelled ended]

  scope :older, lambda { |harvest|
    where(seed: harvest.seed)
      .where('created_at < ?', harvest.created_at)
  }
end

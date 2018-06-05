# frozen_string_literal: true

class Harvest < ApplicationRecord
  validates :seed, :initial_date,
            :end_date_prediction, :employee, presence: true

  belongs_to :farm

  scope :older, lambda { |harvest|
    where(seed: harvest.seed)
      .where('created_at < ?', harvest.created_at)
  }
end

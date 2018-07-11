# frozen_string_literal: true

class Harvest < ApplicationRecord
  validates :seed, :initial_date, :state,
            :end_date_prediction, :employee, presence: true

  validates :final_notes, :state, :total_collected,
            presence: true, unless: :new_record?

  validate :older_active_harvest

  belongs_to :farm
  belongs_to :user
  has_many :events

  enum state: %i[active cancelled ended]

  scope :older, lambda { |harvest|
    where(seed: harvest.seed, farm: harvest.farm)
      .where('created_at < ?', harvest.created_at)
  }

  def older_active_harvest
    return unless farm.active_harvest.try(:active?) &&
                  farm.active_harvest.id != id
    errors.add(:seed, :has_other_active_farm)
  end

  private

  def updating?
    new_record?
  end
end

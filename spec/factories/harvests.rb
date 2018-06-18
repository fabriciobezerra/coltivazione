# frozen_string_literal: true

FactoryBot.define do
  factory :harvest do
    seed 'Soja'
    initial_date 3.days.from_now
    end_date_prediction 6.months.from_now
    employee FFaker::NameBR.unique.first_name
    farm
    user { farm.user }
    state 'active'
  end
end

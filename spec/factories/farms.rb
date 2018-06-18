# frozen_string_literal: true

FactoryBot.define do
  factory :farm do
    name FFaker::NameBR.unique.first_name
    address FFaker::AddressBR.unique.full_address
    size '400'
    latitude 32.3454
    longitude 96.5453
    user
  end
end

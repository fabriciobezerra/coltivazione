# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    date '2018-07-06'
    text 'MyString'
    harvest nil
    user nil
  end
end

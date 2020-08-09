# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    user
    event
    seat_code { 'A1' }
  end
end

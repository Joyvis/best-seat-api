# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    event
    seat_code { 'A3' }
    row { 1 }
    column { 3 }
  end
end

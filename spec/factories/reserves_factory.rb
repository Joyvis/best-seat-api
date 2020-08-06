FactoryBot.define do
  factory :reserve do
    user
    event
    seat_code { 'A1' }
  end
end

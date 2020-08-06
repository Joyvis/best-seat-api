FactoryBot.define do
  factory :event do
    name { 'Foo Bar Event' }
    rows { 5 }
    columns { 5 }
  end
end

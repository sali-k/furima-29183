require 'faker'
Faker::Config.locale = :ja

FactoryBot.define do
  factory :purchase_address do
    association :user
    association :item
    token           { Faker::Bank.iban }
    post_code       { Faker::Address.postcode }
    prefectures_id  { Faker::Number.between(from: 1, to: 47) }
    city            { Faker::Address.city }
    home_number     { Faker::Address.building_number }
    phone_number    { Faker::Number.number(digits: 11) }
  end
end

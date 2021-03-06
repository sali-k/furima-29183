require 'faker'

FactoryBot.define do
  factory :user do
    nickname              { Faker::App.name }
    email                 { Faker::Internet.free_email }
    password              { 'a000000' }
    password_confirmation { password }
    family_name           { '阿部' }
    first_name            { '圭佑' }
    family_name_kana      { 'アベ' }
    first_name_kana       { 'ケイスケ' }
    birth_date { '1999-01-01' }
  end
end

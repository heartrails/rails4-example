# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :post do
    user
    text { Faker::Lorem.sentence[0..9] }
    url { Faker::Internet.url }
  end
end

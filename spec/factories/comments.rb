# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :comment do
    user
    post
    body { Faker::Lorem.sentence[0..4] }
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :user do
    sequence(:username) {|n| Faker::Internet.user_name[0..8] + n.to_s }
    password { 'abcdefghjkmnpqrtuvwxyzABCDEFGHJKLMNPQRTUVWXY346789+-*#$_'.chars.sample(8).join }
    password_confirmation { password }
  end
end

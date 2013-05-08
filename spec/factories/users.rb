# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { 'abcdefghjkmnpqrtuvwxyzABCDEFGHJKLMNPQRTUVWXY346789+-*#$_'.chars.sample(8).join }
    password_confirmation { password }
  end
end

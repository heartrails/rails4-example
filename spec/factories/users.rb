# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    crypted_password "MyString"
    salt "MyString"
  end
end

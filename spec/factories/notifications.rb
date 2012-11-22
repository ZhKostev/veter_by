# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    email "MyString"
    condition "MyString"
    level 1.5
  end
end

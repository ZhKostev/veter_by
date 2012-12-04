# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :generator_state do
    wind_generator_id 1
    wind_speed 1.5
    power 1.5
    error false
  end
end

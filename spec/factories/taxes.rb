# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tax do
    state "VA"
    rate 0.05
  end
end

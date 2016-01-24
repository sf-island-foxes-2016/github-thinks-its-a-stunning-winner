# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) { |n| "Shipper #{n}" }
  factory :shipper do
    name
  end
end

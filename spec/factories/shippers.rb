# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:shipper_name) { |n| "Shipper #{n}" }
  factory :shipper do
    name shipper_name
  end
end

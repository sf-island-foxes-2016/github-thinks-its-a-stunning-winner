# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shipping_cost do
    cost 1.5
    state "VA"
    shipper
  end
end

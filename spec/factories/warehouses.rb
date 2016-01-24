# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :warehouse do
    product
    stock 20
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cart_product do
    quoted_price 12.14
    quantity 3
    cart
    product
  end
end

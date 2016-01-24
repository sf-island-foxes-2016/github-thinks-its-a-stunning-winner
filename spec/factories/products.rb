# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:product_name) { |n| "Product #{n}" }
  factory :product do
    name product_name
    price 12.43
    image "http://robohash.org/veritatispraesentiumodit.png?size=300x300"
    category
  end
end

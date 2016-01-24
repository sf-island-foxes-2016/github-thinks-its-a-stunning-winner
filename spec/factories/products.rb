# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) { |n| "Product #{n}" }
  factory :product do
    name
    price 12.43
    image "http://robohash.org/veritatispraesentiumodit.png?size=300x300"
    category
  end
end

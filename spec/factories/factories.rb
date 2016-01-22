# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    title "user"
    password { Faker::Internet.user_name }
  end
end


FactoryGirl.define do
  factory :product do
    stock_count 1
    name "MyString"
    price 1.5
    image "MyString"
    category nil
  end
end

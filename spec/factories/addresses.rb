# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    city "MyString"
    state "MyString"
    zip 1
    nickname "MyString"
    user_id rand(10001..99999)
  end
end

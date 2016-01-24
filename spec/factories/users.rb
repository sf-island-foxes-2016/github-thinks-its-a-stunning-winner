# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence(:username) { |n| "User_{n}" }
  factory :user do
    first_name "Mia"
    last_name "Jon"
    username
    password 'password'
  end

  trait :admin do
    admin true
  end

  trait :non_admin do
    admin false
  end
end



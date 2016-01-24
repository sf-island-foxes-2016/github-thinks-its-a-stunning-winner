# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence(:username) { |n| "User_{n}" }
  factory :user do
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



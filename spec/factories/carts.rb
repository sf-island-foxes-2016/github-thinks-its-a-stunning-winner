# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cart do
    user
  end

  trait :pending do
    order_id nil
  end

  trait :sold do
    order
  end
end



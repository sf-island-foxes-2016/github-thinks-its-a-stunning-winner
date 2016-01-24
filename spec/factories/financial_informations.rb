# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:card_num) { |n| "123456789012345#{n}" }
  factory :financial_information do
    card_num
    expiry "10/16"
    ccid 1234
    address
    user
  end
end

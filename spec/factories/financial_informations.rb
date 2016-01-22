# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :financial_information do
    card_num ""
    expiry 1
    ccid 1
    address_id 1
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    mailing_address_id 1
    billing_information_id 1
  end
end

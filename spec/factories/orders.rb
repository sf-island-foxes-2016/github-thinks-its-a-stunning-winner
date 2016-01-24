# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    mailing_address
    billing_information
    cart
  end
end

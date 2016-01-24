# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street '212 Baker Street'
    city "London"
    state "CT"
    zip 12345
    nickname "home"
    user
  end
end

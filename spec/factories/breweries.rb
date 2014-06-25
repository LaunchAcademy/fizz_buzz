# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brewery do
    sequence(:name) {|n| "Brewery #{n}"}
    description "Fine beer"
    address "123 Street St."
    state "MA"
    city "Boston"
    zip "12345"
    hours "4:00 - 7:00"
    phone_number "123-123-3456"
    url "www.example.com"
  end
end

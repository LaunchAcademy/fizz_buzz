# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    title "Great beer"
    body "This beer was great"
    rating 3
    user
    brewery
  end
end

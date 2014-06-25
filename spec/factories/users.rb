# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) { |n| "example#{n}@example.com" }
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    email
    password "password"
    password_confirmation "password"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    email "example@example.com"
    password "password"
    password_confirmation "password"
  end
end

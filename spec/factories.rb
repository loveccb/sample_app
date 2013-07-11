FactoryGirl.define do
  factory :user do
    name     "Bob"
    email    "bob@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
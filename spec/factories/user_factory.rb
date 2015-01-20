FactoryGirl.define do
    factory :user do
      sequence(:email) { |n| "user#{n}@blocitoffapi.com" }
      password "password"
      password_confirmation "password"
      admin false

    end
end
FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      dob {Faker::Date.birthday(min_age: 18, max_age: 65)}
      mobile {Faker::PhoneNumber.phone_number}
      password {Faker::Lorem.characters(number: 6)}
    end
  end
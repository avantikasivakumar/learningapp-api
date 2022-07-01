FactoryBot.define do
    factory :board do
      name { Faker::Name.name }
      title { Faker::Lorem.characters(number: 6) }
      image {Faker::Lorem.characters(number: 10)}
    end
  end
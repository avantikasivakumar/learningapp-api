FactoryBot.define do
    factory :subject do
      title { Faker::Name.name }
      image {Faker::Lorem.characters(number: 10)}
    end
  end
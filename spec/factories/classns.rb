FactoryBot.define do
    factory :classn do
      title { Faker::Number.number(digits: 1) }
    end
  end
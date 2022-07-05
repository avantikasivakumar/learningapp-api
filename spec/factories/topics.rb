FactoryBot.define do
    factory :topic do
      name { Faker::Name.name }
      course_id {1}
    end
  end
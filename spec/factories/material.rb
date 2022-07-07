FactoryBot.define do
    factory :material do
      topic_id {1}
      file { Faker::Name.name }
    end
  end
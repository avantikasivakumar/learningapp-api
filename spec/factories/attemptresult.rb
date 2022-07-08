FactoryBot.define do
    factory :attempt_result do
      attempt_id {1}
      attempted {true}
      markedforreview {false}
      # transient do
      #   #question_id {1}
      #   result {true}
      #   timetaken {20}
      #   attempted {true}
      #   markedforreview{false}
      # end
    end
  end
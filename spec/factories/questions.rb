FactoryBot.define do
    factory :question do
      exercise_id {1}
      q {'what comes after a?'}
      opt1 {'b'}
      opt2 {'c'}
      opt3 {'d'}
      opt4 {'z'}
      correctoption {1}
      solution {'a b c...'}
    end
  end
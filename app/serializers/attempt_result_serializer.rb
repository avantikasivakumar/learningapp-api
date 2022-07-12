class AttemptResultSerializer < ActiveModel::Serializer
    attributes :chosenoption, :result, :timetaken
    has_one :question
  end
class QuestionSerializer < ActiveModel::Serializer
    attributes :id, :q, :opt1, :opt2, :opt3, :opt4
  end
  
  
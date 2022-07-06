class Question < ApplicationRecord
  belongs_to :exercise
  has_many :attempt_result, dependent: :destroy
  validates_presence_of :q, :opt1, :opt2, :opt3, :opt4, :correctoption, :solution
end

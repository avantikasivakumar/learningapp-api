class Attempt < ApplicationRecord
  belongs_to :exercise
  belongs_to :user
  has_many :attempt_result, dependent: :destroy
end

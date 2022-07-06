class Exercise < ApplicationRecord
  belongs_to :topic
  has_many :question, dependent: :destroy
  has_many :attempt, dependent: :destroy
  validates_presence_of :name, :duration
end

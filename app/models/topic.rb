class Topic < ApplicationRecord
  belongs_to :course
  validates_presence_of :name
  has_many :material, dependent: :destroy
  has_many :exercise, dependent: :destroy
end

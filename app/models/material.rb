class Material < ApplicationRecord
  belongs_to :topic
  validates_presence_of :file
  has_many :materialstat, dependent: :destroy
end

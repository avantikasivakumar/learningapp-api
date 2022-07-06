class Course < ApplicationRecord
    belongs_to :subject
    belongs_to :classn
    belongs_to :board
    has_and_belongs_to_many :user
    has_many :topic, dependent: :destroy
end

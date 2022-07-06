class Subject < ApplicationRecord
    validates_presence_of :title, :image
    has_many :course, dependent: :destroy
end

class Classn < ApplicationRecord
    validates_presence_of :title
    has_many :course, dependent: :destroy
end

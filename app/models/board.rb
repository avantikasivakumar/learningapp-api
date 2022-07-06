class Board < ApplicationRecord
    validates_presence_of :name, :title, :image
    has_many :course, dependent: :destroy
end

class Board < ApplicationRecord
    validates_presence_of :name, :title, :image
end
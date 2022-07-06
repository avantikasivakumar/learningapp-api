class Materialstat < ApplicationRecord
  belongs_to :material
  belongs_to :user
  validates_presence_of :status
end

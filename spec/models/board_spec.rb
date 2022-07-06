require 'rails_helper'

RSpec.describe Board, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:image) }
  it { should have_many(:course)}
end

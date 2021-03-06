require 'rails_helper'

RSpec.describe Subject, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:image) }
  it { should have_many(:course)}
end

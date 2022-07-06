require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:duration) }
  it { should have_many(:question).dependent(:destroy) }
  it { should have_many(:attempt).dependent(:destroy) }
  it { should belong_to(:topic)}
end
